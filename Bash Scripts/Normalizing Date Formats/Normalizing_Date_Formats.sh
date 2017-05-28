#!/bin/bash

dateToName()
    {
        case $1 in
            1|01) month="Jan"   ;;  7|07) month="Jul"   ;;
            2|02) month="Feb"   ;;  8|08) month="Aug"   ;;
            3|03) month="Mar"   ;;  9|09) month="Sep"   ;;
            4|04) month="Apr"   ;;  10) month="Oct"     ;;
            5|05) month="May"   ;;  11) month="Nov"     ;;
            6|06) month="Jun"   ;;  12) month="Dec"     ;;
            *)  echo "`basename $0`: Unknown numeric month value: $1" ; exit 1
        esac    
        return 0
    }

if [[ $# -ne 3 ]]; then
    echo "Usage of: `basename $0`: Month, Day, Year."
    echo 'Example inputs: "August 3 1962" or "8 3 2002"'
    exit 1
fi

if [[ `echo -n $3 | wc -m` -ne 4 ]] ; then 
    echo "`basename $0`: Four-digit year value expected." ; exit 1
elif [[ "$2" -gt 31 ]] ; then
    echo "`basename $0`: Month value could not exceed 31." ; exit 1 
elif [[ `echo -n $2 | wc -m` -gt 2 ]]; then
    echo "`basename $0`: Day value could not consist of more than two digits." ; exit 1 
fi

if [ -z $(echo $1 | sed 's/[[:digit:]]//g')  ]; then
    dateToName $1
else
    month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
    month="$month$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

if [[ $month =~ 'Feb' ]] && [[ $2 -gt 29 ]] ; then  
    echo "February can have up to 29 days." ; exit 1 
elif [[ $month =~ 'Apr' ]] || [[ $month =~ 'Jun' ]] || [[ $month =~ 'Sep' ]] || [[ $month =~ 'Nov' ]] && [[ $2 -gt 30 ]] ; then
    echo "Only up to 30 days for this month." ; exit 1
fi 

echo $month $2 $3
exit 0      
