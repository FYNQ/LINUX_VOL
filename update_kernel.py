import os
import sys
import time
import subprocess
import argparse



def do_cmd(cmd, path):
    process = subprocess.Popen(cmd, cwd=path, shell=True,
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = process.communicate()
    res = out.decode("utf-8")
    print (res)
    process.wait()


def do_update(path):
    print('git pull linux-stable')
    do_cmd('git reset --hard', path)
    do_cmd('git checkout master', path)
    do_cmd('git pull', path)


do_update('/home/user/linux-stable')

