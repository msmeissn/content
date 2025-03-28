#!/bin/bash
# platform = multi_platform_ubuntu
# packages = rsyslog

if [ ! -f /var/log/syslog ]; then
    mkdir -p /var/log/
    touch /var/log/syslog
fi

if ! grep -q "^syslog:" /etc/passwd; then
    useradd syslog
fi

useradd testuser_123
chown testuser_123 /var/log/syslog
