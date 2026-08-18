# SC26
[SC26](https://sc26.supercomputing.org/) NRI/NRE/X-Net Repo

## Confluence
[SC26 NRE](https://gwu-dit.atlassian.net/wiki/spaces/RTS/folder/4619468801)

## Lucid Diagrams
[Diagrams](https://lucid.app/lucidchart/0331a8da-6445-4b2a-b672-6bb8971d9120/edit?invitationId=inv_e36d8b26-b2fa-4245-912c-eace61b076f0&page=UWIgmLjLKKGK#?invitationid=inv_e36d8b26-b2fa-4245-912c-eace61b076f0&referringapp=slack&page=0_0)

## Folders
### Ansible
Ansible playbooks for managing the synchronization state of the nodes

### Helper
Various help files and scripts

### `dynamic-motd.sh`
Put in `/etc/profile.d` to create a small banner on login to show info about the system and current test scenario.  Example
```
==================================================
 Hostname          : ACAD-R630-RU30
 Current Time      : 2026-08-18 11:31:23 EDT
 Chrony Source     : 130.207.244.240
 Chrony Config Mod : 2026-08-18 11:00:06 EDT
 Test Case         : NTP Default Case
==================================================
```
