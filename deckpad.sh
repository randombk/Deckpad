#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"
set -o pipefail

source ./functions.sh

# Start
set_brightness_to_minimum
disable_sleep
start_virtualhere

# Run - Block until Tap on screen
run_prompt_start
block_until_press_on_target

# Quit
run_prompt_stop
restore_brightness
reenable_sleep

