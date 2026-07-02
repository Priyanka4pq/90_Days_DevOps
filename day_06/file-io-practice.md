
# File I/O Practice

## Objective

Practice basic Linux file read and write operations using `touch`, `echo`, `cat`, `head`, `tail`, and `tee`.

---

## 1. Create a File

```bash
touch notes.txt
```

**Observation:** Created an empty file named `notes.txt`.

---

## 2. Write the First Line (Overwrite)

```bash
echo "Day 06 - Linux File I/O Practice" > notes.txt
```

**Observation:** Added the first line to the file. The `>` operator creates or overwrites the file.

---

## 3. Append More Lines

```bash
echo "Learning file read and write operations." >> notes.txt
echo "Practicing Linux commands daily." >> notes.txt
echo "Understanding redirection operators." >> notes.txt
echo "Reading files using cat." >> notes.txt
echo "Using head to read the beginning of a file." >> notes.txt
echo "Using tail to read the end of a file." >> notes.txt
```

**Observation:** Used the `>>` operator to append new lines without deleting existing content.

---

## 4. Write and Display Using `tee`

```bash
echo "Learning DevOps with Linux!" | tee -a notes.txt
```

**Observation:** The `tee` command displayed the text on the terminal and also appended it to the file.

---

## 5. Read the Entire File

```bash
cat notes.txt
```


**Observation:** Displayed the complete contents of the file.

---

## 6. Read the First Two Lines

```bash
head -n 2 notes.txt
```


**Observation:** Displayed only the first two lines.

---

## 7. Read the Last Two Lines

```bash
tail -n 2 notes.txt
```


**Observation:** Displayed only the last two lines.

---

# Final Content of `notes.txt`

```text
Day 06 - Linux File I/O Practice
Learning file read and write operations.
Practicing Linux commands daily.
Understanding redirection operators.
Reading files using cat.
Using head to read the beginning of a file.
Using tail to read the end of a file.
Learning DevOps with Linux!
```

---

# What I Learned

* `touch` creates an empty file.
* `>` writes to a file and overwrites existing content.
* `>>` appends text to a file.
* `tee` writes to a file and displays the output at the same time.
* `cat` displays the complete file.
* `head` and `tail` help read specific parts of a file.
