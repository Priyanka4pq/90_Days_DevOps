# Day 20 – Bash Scripting Challenge

## Project

Log Analyzer and Report Generator

---

## Objective

The objective of this project is to automate log file analysis using Bash scripting. The script scans a log file, counts errors, identifies critical events, generates a summary report, and archives the processed log.

---

## Files

```
day-20/
│
├── log_analyzer.sh
├── sample_log.log
└── day-20-solution.md
```

---

## Features

- Accepts log file as input
- Validates file existence
- Counts ERROR and Failed messages
- Displays CRITICAL events with line numbers
- Shows Top 5 most common ERROR messages
- Generates a daily summary report
- Archives processed log files

---

## Commands Used

- grep
- grep -n
- grep -Ei
- wc
- awk (optional approach)
- sed
- sort
- uniq
- head
- mkdir
- mv
- date

---

## Script

```bash
(Add your log_analyzer.sh code here)
```

---

## Sample Output

```
Total Errors: 7

Critical Events
7: CRITICAL Disk space below threshold
10: CRITICAL Database connection lost

Top Error Messages
3 Connection timed out
2 Permission denied
1 File not found

Report generated successfully.
```

---

## What I Learned

### 1. Log Analysis using grep

I learned how to search log files efficiently using grep, including case-insensitive searches and displaying line numbers.

### 2. Data Processing

I learned how to combine sort, uniq, head, and sed to summarize repeated log messages and identify the most common errors.

### 3. Automation with Bash

I learned how to automate repetitive system administration tasks such as generating reports and archiving processed log files using Bash scripting.

---

## Conclusion

This project demonstrates how Bash scripting can automate server log analysis, making it easier for system administrators to monitor errors, detect critical events, and generate daily reports efficiently.
