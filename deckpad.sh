#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"
set -o pipefail

source ./functions.sh

if ! command -v figlet &>/dev/null || ! command -v xinput &>/dev/null; then
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
    sleep 5
    exit 1
fi

# Start
prepare_fullscreen
set_brightness_to_minimum
disable_sleep
start_virtualhere

# Run - Block until Tap on screen
run_prompt_start
block_until_press_on_target

# Quit
run_prompt_stop
quit_prompt &
quit_prompt_pid=$!
restore_brightness
reenable_sleep
stop_virtualhere
wait quit_prompt_pid
