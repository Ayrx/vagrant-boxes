#!/usr/bin/env bash

tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF
export ATRIAGE_EXPLOITABLE="$HOME/code/exploitable/exploitable/exploitable.py"
export PATH="/home/vagrant/code/reutils":$PATH
EOF
