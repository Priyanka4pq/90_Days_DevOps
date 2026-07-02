

# Day 07 – Linux File System Hierarchy & Scenario-Based Practice

# Part 1: Linux File System Hierarchy

## 1. `/` (Root Directory)

### Purpose

* The root (`/`) is the top-most directory in Linux.
* Every file and directory starts from `/`.

### Command

```bash
ls -l /
```

### Example Output

```text
bin
boot
dev
etc
home
opt
root
tmp
usr
var
```

### I would use this when...

I need to navigate the Linux filesystem or locate important system directories.

---

# 2. `/home`

### Purpose

* Stores home directories of normal users.
* Each user has a separate folder.

Example:

```text
/home/priyanka
/home/ubuntu
```

### Command

```bash
ls -l /home
```

### I would use this when...

I need to access user files or scripts.

---

# 3. `/root`

### Purpose

* Home directory of the root (administrator) user.
* Different from the `/` directory.

### Command

```bash
ls -l /root
```

### I would use this when...

Working as the root user.

---

# 4. `/etc`

### Purpose

* Contains system-wide configuration files.
* Almost every Linux service stores its configuration here.

Examples

```
/etc/hostname
/etc/passwd
/etc/ssh/
```

### Command

```bash
ls -l /etc
```

### I would use this when...

Editing configuration files for services.

---

# 5. `/var/log`

### Purpose

* Stores system and application log files.
* One of the most important directories for DevOps.

Examples

```
syslog
journal
auth.log
```

### Command

```bash
ls -l /var/log
```

### I would use this when...

Troubleshooting application or server issues.

---

# 6. `/tmp`

### Purpose

* Stores temporary files.
* Files are often removed after reboot.

### Command

```bash
ls -l /tmp
```

### I would use this when...

Creating temporary scripts or files.

---

# 7. `/bin`

### Purpose

* Contains essential Linux commands.

Examples

```
ls
cp
mv
cat
```

### Command

```bash
ls -l /bin
```

### I would use this when...

Running basic Linux commands required by the system.

---

# 8. `/usr/bin`

### Purpose

* Contains most user applications and commands.

Examples

```
python3
git
docker
vim
```

### Command

```bash
ls -l /usr/bin
```

### I would use this when...

Running installed software and utilities.

---

# 9. `/opt`

### Purpose

* Stores optional or third-party software.

Examples

```
Google Chrome
Custom Applications
```

### Command

```bash
ls -l /opt
```

### I would use this when...

Installing manually downloaded applications.

---

# Hands-on Practice

## Find Largest Log Files

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

Purpose:
Shows the five largest log files/directories.

---

## View Hostname

```bash
cat /etc/hostname
```

Purpose:
Displays the hostname of the machine.

---

## View Home Directory

```bash
ls -la ~
```

Purpose:
Lists all files (including hidden files) in the current user's home directory.

---

# Part 2: Scenario Practice

# Scenario 1 — Service Not Starting

### Step 1

```bash
systemctl status myapp
```

Why?

Checks whether the service is running, stopped, or failed.

---

### Step 2

```bash
journalctl -u myapp -n 50
```

Why?

Shows the last 50 log entries to identify the reason for failure.

---

### Step 3

```bash
systemctl is-enabled myapp
```

Why?

Checks whether the service starts automatically after boot.

---

### Step 4

```bash
systemctl list-units --type=service
```

Why?

Verifies whether the service exists and lists all active services.

---

**What I learned:**
Always check the service status first, then inspect the logs, verify boot configuration, and confirm the service exists.

---

# Scenario 2 — High CPU Usage

### Step 1

```bash
top
```

Why?

Shows live CPU and memory usage.

---

### Step 2

```bash
ps aux --sort=-%cpu | head -10
```

Why?

Displays the top CPU-consuming processes.

---

### Step 3

```bash
ps -p <PID> -f
```

Why?

Shows detailed information about the process using high CPU.

---

### Step 4

```bash
kill <PID>
```

or

```bash
kill -9 <PID>
```

Why?

Stops the problematic process if necessary (use `kill -9` only when a normal `kill` doesn't work).

---

**What I learned:**
Use `top` for live monitoring, identify the high-CPU process with `ps`, inspect it, and only terminate it if appropriate.

---

# Scenario 3 — Finding Docker Logs

### Step 1

```bash
systemctl status docker
```

Why?

Checks if the Docker service is running and displays recent log entries.

---

### Step 2

```bash
journalctl -u docker -n 50
```

Why?

Shows the last 50 Docker log entries.

---

### Step 3

```bash
journalctl -u docker -f
```

Why?

Follows Docker logs in real time, similar to `tail -f`.

---

**What I learned:**
Services managed by `systemd` store their logs in `journald`, which can be viewed with `journalctl`.

---

# Scenario 4 — Permission Denied

### Step 1

```bash
ls -l /home/user/backup.sh
```

Why?

Checks the current permissions on the script.

---

### Step 2

```bash
chmod +x /home/user/backup.sh
```

Why?

Adds execute (`x`) permission so the script can be run.

---

### Step 3

```bash
ls -l /home/user/backup.sh
```

Why?

Verifies that the execute permission has been added.

---

### Step 4

```bash
./backup.sh
```

Why?

Runs the script to confirm it executes successfully.

---

**What I learned:**
Scripts require execute (`x`) permission. If it's missing, Linux returns a "Permission denied" error.

---

# Key Takeaways

* `/etc` contains configuration files.
* `/var/log` stores logs used for troubleshooting.
* `/home` contains user files.
* `/root` is the root user's home directory.
* `/tmp` stores temporary files.
* `/bin` and `/usr/bin` contain executable commands.
* `/opt` is used for optional or third-party software.
* `systemctl` is used to manage services.
* `journalctl` is used to view logs for `systemd` services.
* `top` and `ps` help identify processes consuming high CPU.
* `chmod +x` makes a script executable.
