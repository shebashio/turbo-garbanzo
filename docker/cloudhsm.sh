#! /bin/bash

# start cloudhsm client
echo -n "* Starting CloudHSM client ... "
/opt/cloudhsm/bin/cloudhsm_client /opt/cloudhsm/etc/cloudhsm_client.cfg &> /tmp/cloudhsm_client_start.log &

# wait for startup
while true
do
    if grep 'libevmulti_init: Ready ' /tmp/cloudhsm_client_start.log &> /dev/null
    then
        echo "[OK]"
        break
    fi
    sleep 0.5
done