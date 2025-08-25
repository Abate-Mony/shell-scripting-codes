#!/bin/bash
# echo "fIRST SCRIPT"
# echo "This is my first script."
# USER_INPUT1=$1
# USER_INPUT2=$2

# if [ "$USER_INPUT1" = "$USER_INPUT2" ]
#  then
#     echo "The two inputs are the same."
# else
#     echo "The two inputs are different."
# fi
for i in {1..10}
do
    echo "Welcome $i times"
done
for (( i=1; i<=10; i++ ))
do 
    echo "Welcome $i times"
done

counter=1
while true
do 
echo "running $counter times"
counter=$(( $counter +1))
if [ "$counter" -gt 10 ]
then 
    break
fi
done