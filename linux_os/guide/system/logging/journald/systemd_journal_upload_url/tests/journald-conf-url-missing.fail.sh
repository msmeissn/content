#!/bin/bash
# packages = systemd-journal-remote
# variables = var_journal_upload_conf_file=/etc/systemd/journal-upload.conf.d/60-journald_upload.conf,var_journal_upload_url=192.168.50.42

a_settings=("ServerKeyFile=/etc/ssl/private/journal-upload.pem" \
     "ServerCertificateFile=/etc/ssl/certs/journal-upload.pem" "TrustedCertificateFile=/etc/ssl/ca/trusted.pem")
[ ! -d /etc/systemd/journal-upload.conf.d/ ] && mkdir /etc/systemd/journal-upload.conf.d/
if grep -Psq -- '^\h*\[Upload\]' /etc/systemd/journal-upload.conf.d/60-journald_upload.conf; then
    printf '%s\n' "" "${a_settings[@]}" >> /etc/systemd/journal-upload.conf.d/60-journald_upload.conf
else
    printf '%s\n' "" "[Upload]" "${a_settings[@]}" >> /etc/systemd/journal-upload.conf.d/60-journald_upload.conf
fi
