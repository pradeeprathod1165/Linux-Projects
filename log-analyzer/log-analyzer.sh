#!/bin/bash

LOGFILE="logs/system.log"
REPORTFILE="reports/log-report.txt"

if [ ! -f "$LOGFILE" ]
then
	echo "log file not found"
	exit 1
fi


echo "========================="
echo       LOG ANALYZER
echo "========================="


echo

TOTAL_LINES=$(wc -l < "$LOGFILE")
TOTAL_WARNINGS=$(grep -c "WARNING" "$LOGFILE")
TOTAL_ERRORS=$(grep -c "ERROR" "$LOGFILE")
TOTAL_INFOS=$(grep -c "INFO" "$LOGFILE")

display_statistics() {

        echo "Total Lines: $TOTAL_LINES"
        echo "Total Warnings: $TOTAL_WARNINGS"
        echo "Total Errors: $TOTAL_ERRORS"
        echo "Total Infos: $TOTAL_INFOS"
}
show_top_error() {
	echo
	echo "TOP ERROR MESSAGES"
	echo "------------------"

	grep "ERROR" "$LOGFILE" | cut -d ':' -f2 | sed 's/^ *//' | sort | uniq -c
}
show_failed_logins() {
	echo
	echo "FAILED LOGIN ANALYSIS"
	echo "---------------------"

	grep "FAILED LOGIN" "$LOGFILE" | cut -d ':' -f2 | sed 's/^ *//' | sort | uniq -c

}
  echo 
  display_statistics
  echo
  show_top_error
  echo 
  show_failed_logins


{
	echo "==== LOG ANALYSIS REPORT ===="
	echo
        display_statistics
	echo
	show_top_error
	echo
	show_failed_logins
	echo
	echo "Generated on:"
	date
} > "$REPORTFILE"

        echo 
	echo "Report Generated Successfully"
	echo "Location: $REPORTFILE"
