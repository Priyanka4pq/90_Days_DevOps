# Day 11 – File Ownership (chown & chgrp)

## 1. What is File Ownership?

Every file and directory in Linux has:

* **Owner (User)** → The user who owns the file.
* **Group** → A collection of users who can share access to the file.

Check ownership:

```bash
ls -l
```

Example output:

```text
-rw-r--r-- 1 ubuntu ubuntu 125 Jul 3 devops-file.txt
```

Explanation:

| Field           | Meaning          |
| --------------- | ---------------- |
| -rw-r--r--      | File permissions |
| 1               | Number of links  |
| ubuntu          | Owner            |
| ubuntu          | Group            |
| 125             | File size        |
| Jul 3           | Date             |
| devops-file.txt | File name        |

---

# 2. Difference Between Owner and Group

**Owner**

* The user who created or owns the file.
* Usually has the highest level of control.

**Group**

* A collection of users.
* Members of the group can access the file according to the assigned group permissions.

---

# 3. Change File Owner

Syntax:

```bash
sudo chown username filename
```

Example:

```bash
sudo chown tokyo devops-file.txt
```

Verify:

```bash
ls -l devops-file.txt
```

---

# 4. Change File Group

Syntax:

```bash
sudo chgrp groupname filename
```

Example:

```bash
sudo groupadd heist-team

sudo chgrp heist-team team-notes.txt
```

Verify:

```bash
ls -l team-notes.txt
```

---

# 5. Change Owner and Group Together

Syntax:

```bash
sudo chown owner:group filename
```

Example:

```bash
sudo chown professor:heist-team project-config.yaml
```

---

# 6. Recursive Ownership

Recursive means **apply changes to a directory and everything inside it**.

Syntax:

```bash
sudo chown -R owner:group directory
```

Example:

```bash
sudo chown -R professor:planners heist-project/
```

Verify:

```bash
ls -lR heist-project/
```

---

# 7. Important Commands

Create user

```bash
sudo useradd username
```

Create group

```bash
sudo groupadd groupname
```

View ownership

```bash
ls -l
```

Change owner

```bash
sudo chown username file
```

Change group

```bash
sudo chgrp group file
```

Change owner and group

```bash
sudo chown owner:group file
```

Recursive ownership

```bash
sudo chown -R owner:group directory
```

---

# 8. Why File Ownership is Important

* Controls who owns a file.
* Allows teams to share files securely.
* Used in application deployments.
* Important for Docker containers.
* Required in CI/CD pipelines.
* Helps secure log files and configuration files.

---

# 9. Key Points

* Every Linux file has an **owner** and a **group**.
* `chown` changes the **owner** (and can also change the group).
* `chgrp` changes only the **group**.
* `-R` applies ownership changes recursively to directories and their contents.
* Always verify ownership changes using `ls -l`.


