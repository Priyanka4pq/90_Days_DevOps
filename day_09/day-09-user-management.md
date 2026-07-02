# Day 09 – Linux User & Group Management Challenge

## Objective

The objective of this challenge was to learn how to manage Linux users and groups, assign users to multiple groups, configure shared directories, and verify permissions by testing file creation.

---

# Users & Groups Created

## Users

- tokyo
- berlin
- professor
- nairobi

## Groups

- developers
- admins
- project-team

---

# Group Assignments

| User | Groups |
|------|--------|
| tokyo | developers, project-team |
| berlin | developers, admins |
| professor | admins |
| nairobi | project-team |

---

# Directories Created

| Directory | Group Owner | Permissions |
|-----------|-------------|-------------|
| /opt/dev-project | developers | 775 (rwxrwxr-x) |
| /opt/team-workspace | project-team | 775 (rwxrwxr-x) |

---

# Commands Used

## Create Users

```bash
sudo useradd -m tokyo
sudo useradd -m berlin
sudo useradd -m professor
sudo useradd -m nairobi
```

## Set Passwords

```bash
sudo passwd tokyo
sudo passwd berlin
sudo passwd professor
sudo passwd nairobi
```

## Verify Users

```bash
cat /etc/passwd | grep tokyo
cat /etc/passwd | grep berlin
cat /etc/passwd | grep professor
cat /etc/passwd | grep nairobi

ls /home
```

## Create Groups

```bash
sudo groupadd developers
sudo groupadd admins
sudo groupadd project-team
```

## Verify Groups

```bash
cat /etc/group | grep developers
cat /etc/group | grep admins
cat /etc/group | grep project-team
```

## Add Users to Groups

```bash
sudo usermod -aG developers tokyo

sudo usermod -aG developers berlin
sudo usermod -aG admins berlin

sudo usermod -aG admins professor

sudo usermod -aG project-team tokyo
sudo usermod -aG project-team nairobi
```

## Verify Group Membership

```bash
groups tokyo
groups berlin
groups professor
groups nairobi
```

## Create Shared Directories

```bash
sudo mkdir -p /opt/dev-project
sudo mkdir -p /opt/team-workspace
```

## Change Group Ownership

```bash
sudo chgrp developers /opt/dev-project
sudo chgrp project-team /opt/team-workspace
```

## Change Permissions

```bash
sudo chmod 775 /opt/dev-project
sudo chmod 775 /opt/team-workspace
```

## Test File Creation

```bash
sudo -u tokyo touch /opt/dev-project/tokyo.txt

sudo -u berlin touch /opt/dev-project/berlin.txt

sudo -u nairobi touch /opt/team-workspace/nairobi.txt
```

## Verify Permissions

```bash
ls -ld /opt/dev-project
ls -ld /opt/team-workspace

ls -l /opt/dev-project
ls -l /opt/team-workspace
```

---

# Screenshots

Add screenshots of the following command outputs:

- User creation (`ls /home`)
- `/etc/passwd` verification
- `/etc/group` verification
- `groups tokyo`
- `groups berlin`
- `groups professor`
- `groups nairobi`
- `/opt/dev-project` permissions
- `/opt/team-workspace` permissions
- Files created inside both directories

---

# What I Learned

- Learned how to create Linux users with home directories using `useradd -m`.
- Understood how Linux groups simplify permission management for multiple users.
- Learned to add users to secondary groups using `usermod -aG`.
- Configured shared directories using group ownership and `775` permissions.
- Verified user permissions by creating files as different users using `sudo -u`.
- Practiced checking users, groups, and directory permissions using commands like `groups`, `ls`, `cat`, and `grep`.

---

# Conclusion

This challenge provided hands-on experience with Linux user and group management. I learned how to create users and groups, manage memberships, configure shared directories, and verify access permissions. These are essential Linux administration skills that are widely used in DevOps and system administration.
