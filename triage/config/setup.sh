#!/usr/bin/env bash

CODE_DIR="$HOME/code"
mkdir -p $CODE_DIR

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y\
	build-essential\
	cmake\
	gdb\
	python3-dev\
	python3-pip\
	git\
	libssl-dev\
	libffi-dev\
	wget\

# Install GEF
git clone https://github.com/hugsy/gef.git $CODE_DIR/gef
echo "source $CODE_DIR/gef/gef.py" >> $HOME/.gdbinit

# Install atriage and exploitable
git clone https://github.com/jfoote/exploitable.git $CODE_DIR/exploitable
git clone https://github.com/Ayrx/atriage.git $CODE_DIR/atriage
pip3 install -e $CODE_DIR/atriage

# Install LIEF and reutils
pip3 install https://github.com/lief-project/LIEF/releases/download/0.9.0/pylief-0.9.0.zip
git clone https://github.com/Ayrx/reutils.git $CODE_DIR/reutils

# Install afl-fuzz
# TODO: We do not currently install afl-fuzz due to a blocking bug with 18.04's
# GCC version documented here:
# https://groups.google.com/forum/#!topic/afl-users/cCzDOLjt1VI<Paste>
# We will uncomment this section when the bug has been fixed.
#
# pushd $CODE_DIR
# wget --quiet http://lcamtuf.coredump.cx/afl/releases/afl-2.52b.tgz
# tar xf afl-2.52b.tgz
# pushd afl-2.52b
# make && sudo make install
# popd
# popd
