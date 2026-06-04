#!/bin/bash

mkdir -p reports
mkdir -p logs

LOGFILE="logs/system.log"
REPORTFILE="reports/log-report.txt"

if [ ! -f "$LOGFILE" ]
then
	echo "log file not found"
	exit 1
fi

echo

TOTAL_LINES=$(wc -l < "$LOGFILE")
TOTAL_WARNINGS=$(grep -c "^WARNING" "$LOGFILE")
TOTAL_ERRORS=$(grep -c "^ERROR" "$LOGFILE")
TOTAL_INFOS=$(grep -c "^INFO" "$LOGFILE")
TOTAL_FAILED_LOGINS=$(grep -c "^FAILED LOGIN" "$LOGFILE")

display_statistics() {

        echo "Total Lines: $TOTAL_LINES"
        echo "Total Warnings: $TOTAL_WARNINGS"
        echo "Total Errors: $TOTAL_ERRORS"
        echo "Total Infos: $TOTAL_INFOS"
	echo "Total failed logins: $TOTAL_FAILED_LOGINS"
}
show_top_errors() {
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

monitor_logs() {
	echo
	echo "Monitoring logs..."
	echo "Press Ctrl+c to stop."
	echo

	tail -f "$LOGFILE"

}


generate_report() {
{
	echo "==== LOG ANALYSIS REPORT ===="
	echo
        display_statistics
	echo
	show_top_errors
	echo
	show_failed_logins
	echo
	echo "Generated on:"
	date
} > "$REPORTFILE"

        echo 
	echo "Report Generated Successfully"
	echo "Location: $REPORTFILE"
}



echo "-------------------------"
echo   LOG ANALYZER
echo "-------------------------"
echo

echo "1 display statistics "
echo "2 show top errors"
echo "3 show failed logins"
echo "4 generate report"
echo "5 monitor logs"
echo "6 Exit"

read -p "Enter choice: " choice

case $choice in
	1)
		display_statistics
		;;
	2)
		show_top_errors
		;;
	3)
		show_failed_logins
		;;
	4)
		generate_report
		;;
	5)
		monitor_logs
		;;
	6)
		echo "Exiting...."
		exit 0
		;;
	*)
		echo "invalid option"
esac


