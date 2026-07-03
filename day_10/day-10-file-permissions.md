# Day 10 – File Permissions & File Operations Challenge

## Objective

Learned how to create, read, and manage files in Linux along with understanding and modifying file permissions using `chmod`.

---

# Files Created

- `devops.txt` (empty file)
- `notes.txt` (contains sample text)
- `script.sh` (shell script)

Contents of `script.sh`

```bash
echo "Hello DevOps"
```

---

# File Creation Commands

```bash
touch devops.txt

echo "This is my Day 10 Linux notes." > notes.txt

vim script.sh
```

Inside `script.sh`

```bash
echo "Hello DevOps"
```

---

# Reading Files

Read notes file

```bash
cat notes.txt
```

View script in read-only mode

```bash
vim -R script.sh
```

Display first 5 lines of `/etc/passwd`

```bash
head -n 5 /etc/passwd
```

Display last 5 lines of `/etc/passwd`

```bash
tail -n 5 /etc/passwd
```

---

# Understanding File Permissions

Check permissions

```bash
ls -l devops.txt notes.txt script.sh
```

Example Output

```text
-rw-r--r-- 1 ubuntu ubuntu 0 Jul 3 10:00 devops.txt
-rw-r--r-- 1 ubuntu ubuntu 30 Jul 3 10:05 notes.txt
-rw-r--r-- 1 ubuntu ubuntu 20 Jul 3 10:10 script.sh
```

Permission Breakdown

| Permission | Meaning |
|------------|---------|
| r | Read (4) |
| w | Write (2) |
| x | Execute (1) |

Example:

```
-rw-r--r--
```

- Owner → Read and Write
- Group → Read only
- Others → Read only
- No one can execute the file

---

# Permission Changes

## 1. Make `script.sh` executable

```bash
chmod +x script.sh
```

Verify

```bash
ls -l script.sh
```

Output

```text
-rwxr-xr-x
```

Run the script

```bash
./script.sh
```

Output

```text
Hello DevOps
```

---

## 2. Make `devops.txt` read-only

```bash
chmod a-w devops.txt
```

Verify

```bash
ls -l devops.txt
```

Output

```text
-r--r--r--
```

---

## 3. Set `notes.txt` permission to 640

```bash
chmod 640 notes.txt
```

Verify

```bash
ls -l notes.txt
```

Output

```text
-rw-r-----
```

Meaning

- Owner → Read & Write
- Group → Read
- Others → No permission

---

## 4. Create `project` directory with permission 755

```bash
mkdir project

chmod 755 project
```

Verify

```bash
ls -ld project
```

Output

```text
drwxr-xr-x
```

Meaning

- Owner → Read, Write, Execute
- Group → Read & Execute
- Others → Read & Execute

---

# Permission Testing

### Try writing to read-only file

```bash
echo "Testing" >> devops.txt
```

Error

```text
bash: devops.txt: Permission denied
```

---

### Remove execute permission

```bash
chmod -x script.sh
```

Try running

```bash
./script.sh
```

Error

```text
bash: ./script.sh: Permission denied
```

---

# Commands Used

```bash
touch
echo
cat
vim
vim -R
head
tail
ls -l
ls -ld
chmod +x
chmod a-w
chmod 640
chmod 755
chmod -x
mkdir
```

---

# What I Learned

- Linux permissions are divided into Owner, Group, and Others.
- The `chmod` command is used to modify file and directory permissions.
- Execute permission (`x`) is required before a script can be run.
- Numeric permissions like 755 and 640 provide an easy way to assign permissions.
- The `ls -l` command helps verify current permissions.

---
