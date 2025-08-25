#!/bin/bash
echo "Game script started"
echo "===================="
echo "Welcome to the Game!"
echo "Let's play a simple number guessing game."

# Initialize variables
TARGET_NUMBER=$(( RANDOM % 100 + 1 ))
ATTEMPTS=0
MAX_ATTEMPTS=10
LOG_FILE="guessing_game_log.txt"

# Handle existing log file
if [ -f "$LOG_FILE" ]; then
    read -p "A previous game log exists. Append to it? (y/n): " APPEND_CHOICE
    if [ "$APPEND_CHOICE" = "y" ] || [ "$APPEND_CHOICE" = "Y" ]; then
        echo "" >> "$LOG_FILE"
        echo "New Game Session - $(date)" >> "$LOG_FILE"
        echo "====================" >> "$LOG_FILE"
        echo "Target number: $TARGET_NUMBER" >> "$LOG_FILE"
        echo "====================" >> "$LOG_FILE"
    else
        # Create new log file
        echo "Guessing Game Log - $(date)" > "$LOG_FILE"
        echo "Target number: $TARGET_NUMBER" >> "$LOG_FILE"
        echo "====================" >> "$LOG_FILE"
    fi
else
    # Create new log file if it doesn't exist
    echo "Guessing Game Log - $(date)" > "$LOG_FILE"
    echo "Target number: $TARGET_NUMBER" >> "$LOG_FILE"
    echo "====================" >> "$LOG_FILE"
fi

read -p "Guess a number between 1 and 100: " USER_GUESS

# Log first attempt
echo "Attempt $((ATTEMPTS+1)): $USER_GUESS" >> "$LOG_FILE"

while [ $ATTEMPTS -lt $MAX_ATTEMPTS ]
do
    if [ $USER_GUESS -eq $TARGET_NUMBER ] 
    then
        echo "Congratulations! You've guessed the correct number: $TARGET_NUMBER"
        echo "You found it in $((ATTEMPTS+1)) attempts!"
        echo "SUCCESS: Found number $TARGET_NUMBER in $((ATTEMPTS+1)) attempts!" >> "$LOG_FILE"
        break
    elif [ $USER_GUESS -lt $TARGET_NUMBER ]; then
        echo "Too low! Try again."
    else
        echo "Too high! Try again."
    fi
    
    ATTEMPTS=$((ATTEMPTS + 1))
    
    # Check if maximum attempts reached
    if [ $ATTEMPTS -eq $MAX_ATTEMPTS ]; then
        echo "Sorry, you've used all your attempts. The number was: $TARGET_NUMBER"
        echo "FAILED: Did not find number $TARGET_NUMBER after $MAX_ATTEMPTS attempts" >> "$LOG_FILE"
        break
    fi
    
    read -p "Guess a number between 1 and 100: " USER_GUESS
    echo "Attempt $((ATTEMPTS+1)): $USER_GUESS" >> "$LOG_FILE"
done

# Final log entry
echo "====================" >> "$LOG_FILE"
echo "Game ended at: $(date)" >> "$LOG_FILE"
echo "Log saved to: $LOG_FILE"