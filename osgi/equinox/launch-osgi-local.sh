export OPENSHIFT_GEAR_DNS=0.0.0.0
export OPENSHIFT_INTERNAL_IP=127.0.0.1
mkdir config-local
# Remove the zookeeper-plugin as no port translation is needed for local runs
sed "s/^.*zookeeper-plugin.*$/\\\\/" < config/config.ini > config-local/config.ini

mkdir load
cp load-template/org.apache.cxf.dosgi.discovery.zookeeper.cfg load
echo zookeeper.host = $OPENSHIFT_INTERNAL_IP >> load/org.apache.cxf.dosgi.discovery.zookeeper.cfg

if [ "$1" = "debug" ]; then
    JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=localhost:7777"
else
    JAVA_OPTS=""
fi

java $JAVA_OPTS -Dorg.ops4j.pax.web.listening.addresses=$OPENSHIFT_GEAR_DNS -jar org.eclipse.osgi_3.7.2.v20120110-1415.jar -configuration config-local -clean 

