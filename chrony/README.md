## Chrony Configs
These are `chronyd` configuration files that are sym linked to `/etc/chronyd.conf`.  They should be placed in `/etc/000chrony-configs`  Ansible will change the sym link and stop/start chronyd for the changes to take effect.

## Prometheus Exporter
Using [chrony exporter](https://github.com/SuperQ/chrony_exporter) to expose chrony info via Prometheus
(currently running in a `tmux` session....need to build a unit file!)
