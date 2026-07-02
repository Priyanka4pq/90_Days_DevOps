
# Linux Architecture Notes

## What is Linux?

Linux is an open-source operating system that manages computer hardware and software resources. It acts as a bridge between applications and the hardware.

---

# Core Components of Linux

## 1. Kernel

* The core of the Linux operating system.
* Directly communicates with the hardware.
* Responsible for:

  * Process management
  * Memory management
  * Device management
  * File systems
  * Networking

**Without the kernel, Linux cannot function.**

---

## 2. User Space

* The area where user applications run.
* Examples:

  * Bash
  * Chrome
  * VS Code
  * Python
* Programs cannot directly access hardware; they request services from the kernel using **system calls**.

---

## 3. Init / systemd

* The first process started after the Linux kernel boots.
* It has **Process ID (PID) 1**.
* Responsible for:

  * Starting system services
  * Managing background services
  * Restarting failed services
  * Handling the boot process

Modern Linux distributions use **systemd** as the init system.

---

# How Processes Are Created and Managed

A process is a running instance of a program.

Process creation:

1. A user runs a command.
2. The shell requests the kernel to create a new process.
3. The kernel assigns a unique **PID (Process ID)**.
4. The process executes until it finishes or is terminated.

The kernel manages:

* CPU scheduling
* Memory allocation
* Process priority
* Process termination

---

# Process States

* **Running (R)** – Currently executing on the CPU.
* **Sleeping (S)** – Waiting for an event (most common state).
* **Stopped (T)** – Paused by the user or another process.
* **Zombie (Z)** – Process has finished, but its parent hasn't collected its exit status yet.
* **Idle** – Waiting for CPU time.

---

# Why systemd Matters

systemd helps manage the operating system efficiently.

It can:

* Start services during boot
* Stop and restart services
* Enable services to start automatically
* View service status
* Collect logs using `journalctl`

Example:

```bash
sudo systemctl status nginx
```

---

# 5 Linux Commands I Will Use Daily

```bash
ps aux            # View running processes
top               # Monitor CPU and memory usage
systemctl status  # Check service status
journalctl -xe    # View system logs
kill <PID>        # Terminate a process
```

---

# Key Takeaways

* The **kernel** is the core of Linux.
* **User Space** is where applications run.
* **systemd** manages services and the boot process.
* Every running program is a process with a unique PID.
* Understanding processes and systemd is essential for Linux troubleshooting and DevOps.
