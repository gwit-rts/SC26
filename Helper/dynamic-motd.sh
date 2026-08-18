#!/bin/bash

# Only display for interactive logins
[[ $- != *i* ]] && return

HOSTNAME=$(hostname -f 2>/dev/null || hostname)
CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S %Z')

# read what test we're running
read -r CURRENT_TEST < /var/lib/misc/current-test-case

# Currently selected Chrony source
CHRONY_SOURCE=$(chronyc -n sources 2>/dev/null | awk '$1 ~ /^[#^]\*/ {print $2}')


# Last modification time of chrony.conf
CHRONY_CONF_MTIME=$(date -d "$(stat -c '%y' /etc/chrony.conf 2>/dev/null)" \
    '+%Y-%m-%d %H:%M:%S %Z' 2>/dev/null)

cat <<EOF

==================================================
 Hostname          : ${HOSTNAME}
 Current Time      : ${CURRENT_TIME}
 Chrony Source     : ${CHRONY_SOURCE:-Not synchronized}
 Chrony Config Mod : ${CHRONY_CONF_MTIME:-Unavailable}
 Test Case         : ${CURRENT_TEST}
==================================================

EOF
