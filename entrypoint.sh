#!/usr/bin/env sh

sed -i "s/secret_discord_bot_token/$token/" config/options.ini

python3.5 run.py

