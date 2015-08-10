#!/bin/bash

curl -O https://www.loggly.com/install/configure-linux.sh
curl -O https://www.loggly.com/install/configure-file-monitoring.sh

sed -i "s/checkIfLogsMadeToLoggly$/echo \"Not checking...\"/g" configure-linux.sh
sed -i "s/checkIfFileLogsMadeToLoggly$//g" configure-file-monitoring.sh
sed -i "s/curl .*//g" configure-file-monitoring.sh

base_path=/var/log/containership/applications

for application in $( ls ${base_path} ); do
    for container in $( ls ${base_path}/${application} ); do
        sudo bash configure-file-monitoring.sh -a ${LOGGLY_ACCOUNT} -t ${LOGGLY_TOKEN} -u ${LOGGLY_USERNAME} -p "${LOGGLY_PASSWORD}" -f "${base_path}/${application}/${container}/stdout" -l "${application}-${container}"
        sudo bash configure-file-monitoring.sh -a ${LOGGLY_ACCOUNT} -t ${LOGGLY_TOKEN} -u ${LOGGLY_USERNAME} -p "${LOGGLY_PASSWORD}" -f "${base_path}/${application}/${container}/stderr" -l "${application}-${container}"
    done
done

PID=$(pidof rsyslogd)
kill -9 ${PID}

echo "Starting rsyslogd..."
/usr/sbin/rsyslogd
echo "Started."
