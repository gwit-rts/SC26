# Chrony Configs
These are `chronyd` configuration files that are sym linked to `/etc/chronyd.conf`.  They should be placed in `/etc/000chrony-configs`  Ansible will change the sym link and stop/start chronyd for the changes to take effect.

_*NOTE*_ ACAD & Support use different NTP servers in the Worst Case test scenario.  The Ansible playbook assumes the same file name exists on the hosts, so remove the prefix from `[ACAD|SUPP]-worst_case-chrony.conf`
