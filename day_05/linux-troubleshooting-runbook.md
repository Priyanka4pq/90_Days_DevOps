
# Linux Troubleshooting Runbook

## Target Service

**Service:** Docker

**Purpose:** Verify that the Docker service is healthy and identify any issues related to CPU, memory, disk, network, or logs.

---

# Environment Basics

## 1. Check Kernel Information

```bash
uname -a
```

**Output:** ![sample Output](image1)

**Observation:** Verified the Linux kernel version and system architecture.

---

## 2. Check OS Information

```bash
cat /etc/os-release
```

**Output:** ![sample Output](image2)

**Observation:** Confirmed the Linux distribution and version.

---

# Filesystem Sanity

## 3. Create a Temporary Directory

```bash
mkdir /tmp/runbook-demo
```

**Observation:** Temporary directory created successfully.

---

## 4. Copy and Verify a File

```bash
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo
```

**Output:** ![sample Output](image3)

**Observation:** File copied successfully and permissions verified.

---

# CPU & Memory Snapshot

## 5. Check Running Process

```bash
ps -o pid,pcpu,pmem,comm -C dockerd
```

**Output:** ![sample Output](image4)

**Observation:** Docker daemon is using normal CPU and memory resources.

---

## 6. Check Memory Usage

```bash
free -h
```


**Observation:** Sufficient free memory is available.

---

# Disk & IO Snapshot

## 7. Check Disk Usage

```bash
df -h
```


**Observation:** Disk usage is within normal limits.

---

## 8. Check Log Directory Size

```bash
du -sh /var/log
```

**Output:** 
![sample Output](image5)

**Observation:** Log directory size is reasonable.

---

# Network Snapshot

## 9. Check Listening Ports

```bash
ss -tulpn
```

**Output:** 
![sample Output](image6)

**Observation:** Verified active listening services.

---

## 10. Check Internet Connectivity

```bash
curl -I https://www.google.com
```

**Output:** 
![sample Output](image7)

**Observation:** Internet connectivity is working correctly.

---

# Logs Reviewed

## 11. Docker Service Logs

```bash
sudo journalctl -u docker -n 50
```

**Observation:** No critical errors were found in the recent Docker logs.

---

## 12. System Log

```bash
tail -n 50 /var/log/syslog
```


**Observation:** Recent system logs do not show any major issues.

---

# Quick Findings

* Docker service is active and running.
* CPU and memory usage are normal.
* Disk usage is healthy.
* Network connectivity is working.
* No critical errors were found in the service logs.

---

# If This Worsens

1. Restart the Docker service using:

```bash
sudo systemctl restart docker
```

2. Enable more detailed logging and collect additional logs using `journalctl`.

3. Investigate the Docker process further using tools such as `strace`, `htop`, or `docker inspect` if high CPU, memory, or unexpected behavior is observed.
