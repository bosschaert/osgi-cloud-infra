mkdir load
cp load-template/org.apache.cxf.dosgi.discovery.zookeeper.cfg load
echo zookeeper.host = $OPENSHIFT_INTERNAL_IP >> load/org.apache.cxf.dosgi.discovery.zookeeper.cfg
java -Dcom.sun.management.jmxremote.port=29999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Dorg.ops4j.pax.web.listening.addresses=$OPENSHIFT_INTERNAL_IP -jar org.eclipse.osgi_3.7.2.v20120110-1415.jar -configuration config -clean 
