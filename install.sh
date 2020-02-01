#!/usr/bin/env bash
set -e
ln -s `pwd`/watcher.service /lib/systemd/system/watcher.service
systemctl daemon-reload
systemctl enable watcher.service
systemctl start watcher.service
