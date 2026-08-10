#!/bin/bash

# ========================================
# Log Analyzer and Report Generator
# Author: Priyanka
# ========================================

# ---------- Task 1: Input Validation ----------

if [ $# -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh <log_file>"
    exit 1
fi

LOG_FILE=$1

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

REPORT_FILE="log_report_$(date +%Y-%m-%d).txt"

echo "Analyzing log file..."
echo

# ---------- Task 2: Error Count ----------

ERROR_COUNT=$(grep -Ei "ERROR|Failed" "$LOG_FILE" | wc -l)

echo "Total Errors: $ERROR_COUNT"

echo

# ---------- Task 3: Critical Events ----------

echo "------ Critical Events ------"

CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_FILE")

if [ -z "$CRITICAL_EVENTS" ]; then
    echo "No critical events found."
else
    echo "$CRITICAL_EVENTS"
fi

echo

# ---------- Task 4: Top 5 Error Messages ----------

echo "------ Top 5 Error Messages ------"

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" \
| sed 's/^.*ERROR[: ]*//' \
| sort \
| uniq -c \
| sort -rn \
| head -5)

if [ -z "$TOP_ERRORS" ]; then
    echo "No ERROR messages found."
else
    echo "$TOP_ERRORS"
fi

# ---------- Task 5: Summary Report ----------

TOTAL_LINES=$(wc -l < "$LOG_FILE")

{
echo "==========================================="
echo "        LOG ANALYSIS REPORT"
echo "==========================================="
echo
echo "Date of Analysis : $(date)"
echo "Log File         : $LOG_FILE"
echo "Total Lines      : $TOTAL_LINES"
echo "Total Errors     : $ERROR_COUNT"
echo
echo "----------- Top 5 Error Messages ----------"
if [ -z "$TOP_ERRORS" ]; then
    echo "No ERROR messages found."
else
    echo "$TOP_ERRORS"
fi
echo
echo "----------- Critical Events ---------------"
if [ -z "$CRITICAL_EVENTS" ]; then
    echo "No critical events found."
else
    echo "$CRITICAL_EVENTS"
fi
echo
echo "==========================================="
} > "$REPORT_FILE"

echo
echo "Report generated successfully: $REPORT_FILE"

# ---------- Task 6: Archive Log ----------

mkdir -p archive

mv "$LOG_FILE" archive/

echo "Processed log moved to archive/"

echo
echo "Analysis Completed Successfully."
