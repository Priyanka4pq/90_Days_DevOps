
# Linux Commands Cheat Sheet

## 📁 File System Commands

| Command                     | Usage                                        |
| --------------------------- | -------------------------------------------- |
| `pwd`                       | Show the current working directory.          |
| `ls -la`                    | List all files and directories with details. |
| `cd <directory>`            | Change the current directory.                |
| `mkdir <dir>`               | Create a new directory.                      |
| `touch <file>`              | Create a new empty file.                     |
| `cp <source> <destination>` | Copy files or directories.                   |
| `mv <source> <destination>` | Move or rename files/directories.            |
| `rm -r <directory>`         | Remove a directory and its contents.         |
| `cat <file>`                | Display the contents of a file.              |
| `find . -name "<file>"`     | Search for a file by name.                   |

---

## ⚙️ Process Management Commands

| Command                  | Usage                                      |
| ------------------------ | ------------------------------------------ |
| `ps aux`                 | Display all running processes.             |
| `top`                    | Monitor system processes in real time.     |
| `htop`                   | Interactive process viewer (if installed). |
| `kill <PID>`             | Terminate a process using its PID.         |
| `killall <process-name>` | Kill all processes with the given name.    |
| `jobs`                   | Show background jobs in the current shell. |
| `bg`                     | Resume a stopped job in the background.    |
| `fg`                     | Bring a background job to the foreground.  |

---

## 🌐 Networking Commands

| Command         | Usage                                           |
| --------------- | ----------------------------------------------- |
| `ping <host>`   | Check network connectivity to a host.           |
| `ip addr`       | Display IP addresses and network interfaces.    |
| `curl <URL>`    | Send an HTTP request and fetch data from a URL. |
| `dig <domain>`  | Query DNS information for a domain.             |
| `ss -tuln`      | Display listening TCP and UDP ports.            |
| `netstat -tuln` | Show active network connections (legacy).       |

---

## 📜 Logs & Services

| Command                      | Usage                                  |
| ---------------------------- | -------------------------------------- |
| `journalctl -xe`             | View detailed system logs.             |
| `systemctl status <service>` | Check the status of a service.         |
| `tail -f <logfile>`          | Monitor log file updates in real time. |

---

## 💡 Quick Tips

* Use `man <command>` to read the manual for any command.
* Use `history` to view previously executed commands.
* Press **Ctrl + C** to stop a running command.
* Press **Tab** for command and file name auto-completion.

---

## Commands I Expect to Use Daily

* `ls -la`
* `pwd`
* `cd`
* `cat`
* `ps aux`
* `top`
* `kill`
* `systemctl status`
* `journalctl -xe`
* `tail -f`
* `ping`
* `ip addr`
* `curl`
