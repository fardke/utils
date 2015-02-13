#!/bin/bash

function convert_vcalendar
{
    param=$1
    param=`echo $param|awk -F ":" '{print $2}'`
    #convert from YYYYmmddTHHMMss to nameday day namemonth year HH:MM:SS
    date=`date -d "$(echo $param|sed -r 's/(.*)T(..)(..)(..)/\1 \2:\3:\4/')" +"%a %d %b %Y %X"`
}

arg=$@

#while read line
#do
#    echo $line
#done < $arg

#read lines
organizer=`cat $arg|grep "ORGANIZER;CN="|sed -r 's/ORGANIZER;CN=//'`
start=`cat $arg|grep "DTSTART;TZID"`
end=`cat $arg|grep "DTEND;TZID"`
location=`cat $arg|grep "^LOCATION"|sed -r 's/LOCATION://'`
method=`cat $arg|grep "METHOD"|sed -r 's/METHOD://'`
attendee=`cat $arg|grep "ATTENDEE"|sed -r 's/LOCATION://'`
summary=`cat $arg|grep "SUMMARY"|sed -r 's/SUMMARY://'`
description=`cat $arg|awk '/DESCRIPTION/ { show=1 } show; /LAST-MODIFIED/ { show=0 }'|sed -r 's/DESCRIPTION://'|sed -r 's/LAST-MODIFIED:.*//'`
created=`cat $arg|grep "CREATED"|sed -r 's/CREATED://'`

#clean dates
convert_vcalendar $start
start=$date
convert_vcalendar $end
end=$date
convert_vcalendar $created
created=$date

#clean organizer name
organizer=`echo $organizer|awk -F ":" '{print $1}'`

if [ $method == "REQUEST" ]; then
    #display invit
    echo -e "\n"
    echo "***** NOUVELLE INVITATION *****"
    echo "$summary"
    echo -e "\n\n"
    echo "Debut:          $start"
    echo "Fin:            $end"
    echo "Organisateur:   $organizer"
    echo "Lieu:           $location"
    echo "Créé:           $created"
    echo -e "Description:\n $description"
elif [ $method == "REPLY" ]; then
    echo -e "\n"
    echo "***** RÉPONSE À INVITATION *****"
    echo "$summary"
    echo -e "\n\n"
    echo "Debut:          $start"
    echo "Fin:            $end"
    echo "Lieu:           $location"
elif [ $method == "CANCEL" ]; then
    echo -e "\n"
    echo "***** RÉUNION ANNULÉE *****"
    echo "$summary"
    echo -e "\n\n"
    echo "Debut:          $start"
    echo "Fin:            $end"
    echo "Organisateur:   $organizer"
    echo "Créé:           $created"
    echo "Lieu:           $location"
else
    echo -e "\n"
    echo "***** FORMAT D'INVITATION NON RECONNU *****"
    echo "$summary"
    echo -e "\n\n"
fi
