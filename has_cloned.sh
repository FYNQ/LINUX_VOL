#!/bin/bash
if [ ! -f "/home/user/linux-stable/README" ]; then
    echo "needs to clone"
    cd /home/user/ && git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
fi
