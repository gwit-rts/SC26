# Ansible for SC26

## Playbooks
Playbooks are run via cron based on the following schedule
```
0000 - 0600 = PTP
0600 - 1200 = NTP - best case
1200 - 1800 = NTP - default case
1800 - 0000 - NTP - worst case
```
### Tasks
General outline of the playbooks
 1. change the symbolic link for `chronyd`.  config files are prestaged on each node for each test case;
 2. stop `chronyd`;
 3. Generate a timestamp;
 4. Generate list of log files in `/var/log/chrony` for archiving;
 5. Archive any logs found;
 6. Start `chronyd`;
 7. Write name of test case to `/var/lib/misc/current-test-case` which is used by `/etc/profile.d/dymamic-motd.sh`

For the transition from NTP --> PTP and PTP--> NTP, `timemaster` is either started or stopped as needed.

## Crontab
On the Ansible control node, this is the crontab I'm using
```
## change test scenario every 6 hours;
 0 0 * * * cd /home/ansibleuser/ansiblefiles/SC26/; ansible-playbook NTP-worst_case-to-timemaster.yml > /tmp/cronlog.txt
 0 6 * * * cd /home/ansibleuser/ansiblefiles/SC26/; ansible-playbook timemaster-to-NTP-best_case.yml  > /tmp/cronlog.txt
 0 12 * * * cd /home/ansibleuser/ansiblefiles/SC26/; ansible-playbook NTP-best_case-to-default_case.yml  > /tmp/cronlog.txt
 0 18 * * * cd /home/ansibleuser/ansiblefiles/SC26/; ansible-playbook NTP-default_case-to-worst_case.yml  > /tmp/cronlog.txt
```
