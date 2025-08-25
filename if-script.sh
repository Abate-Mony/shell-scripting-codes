#!/bin/bash
#learning if statement in bast script
echo "First if script"
if [ 1 = 1 ]
 then
    echo "Condition is true."
fi
read -p "Enter a number: " NUM

if [ $NUM -gt 100 ]
then 
    echo "we have entered in IF block"
    sleep 2
    echo "The number is greater than 100"
    echo 
    date
else
    if [ $NUM -eq 100 ]
    then
        echo "The number is equal to 100"
    else
        echo "The number is less than 100"
    fi
    echo "The number is less than or equal to 100"

fi

