DISCOVERY_VM=... specify Discovery VM SSH login here, something like blahblahblah@discoserver-coderthoughts.rhcloud.com

chmod 600 disco_id_rsa
REMOTE_GEAR_IP=`ssh -q -o "StrictHostKeyChecking no" -i ./disco_id_rsa $DISCOVERY_VM printenv OPENSHIFT_INTERNAL_IP`
echo REMOTE GEAR IP: $REMOTE_GEAR_IP
ssh -q -g -o "StrictHostKeyChecking no" -i ./disco_id_rsa -N -L $OPENSHIFT_INTERNAL_IP:21810:$REMOTE_GEAR_IP:21810 $DISCOVERY_VM
