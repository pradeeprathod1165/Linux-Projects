#!/bin/bash

LOGFILE="logs/system.log"

echo "========================="
echo       LOG ANALYZER
echo "========================="


echo

TOTAL_LINES=$(wc -l < "$LOGFILE")
TOTAL_WARNINGS=$(grep -c "WARNING" "$LOGFILE")
TOTAL_ERRORS=$(grep -c "ERROR" "$LOGFILE")
TOTAL_INFOS=$(grep -c "INFO" "$LOGFILE")


echo "Total Line: $TOTAL_LINES"
echo "Total Warnings: $TOTAL_WARNINGS"
echo "Total Errors: $TOTAL_ERRORS"
echo "Total Infos: $TOTAL_INFOS"
  
