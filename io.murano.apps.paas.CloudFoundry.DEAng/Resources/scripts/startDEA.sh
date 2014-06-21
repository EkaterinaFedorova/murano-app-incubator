#!/bin/bash

function include(){
    curr_dir=$(cd $(dirname "$0") && pwd)
    inc_file_path=$curr_dir/$1
    if [ -f "$inc_file_path" ]; then
        . $inc_file_path
    else
        echo -e "$inc_file_path not found!"
        exit 1
    fi
}
include "common.sh"
. ~/.profile

cd /root
cd cf_nise_installer

bash ./scripts/start.sh > start.log

tail start.log | grep Login

#add_fw_rule '-I INPUT 1 -p tcp -m tcp --dport 8080 -j ACCEPT -m comment --comment "by murano, CloudFoundry"'


