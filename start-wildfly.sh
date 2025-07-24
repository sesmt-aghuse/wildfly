#!/bin/bash

#echo "JBOSS_HOME: $JBOSS_HOME"

# Verify JBOSS_HOME is set
#if [ -z "$JBOSS_HOME" ]; then
#    echo "Error: JBOSS_HOME environment variable is not set"
#    exit 1
#fi

# Change to WildFly bin directory
#cd "bin" || { echo "Failed to enter bin directory"; exit 1; }

# -XX:MetaspaceSize=99M -XX:MaxMetaspaceSize=999M \
set JAVA_OPTS=-Xms5G -Xmx5G -XX:MetaspaceSize=99M -XX:MaxMetaspaceSize=2G

# Start WildFly with all configurations
./bin/standalone.sh \
  --server-config=standalone-full.xml \
  -Dprogram.name="JBossTools: WildFly 24+" \
  -Djava.awt.headless=true \
  -Djava.net.preferIPv4Stack=true \
  -Djboss.server.base.dir="standalone" \
  -Djboss.home.dir="." \
  -Djboss.mail.server.host=smtp.gmail.com \
  -Djboss.mail.server.port=587 \
  -Djboss.as.management.blocking.timeout=9999999 \
  -Djboss.modules.system.pkgs=org.jboss.byteman \
  -Dorg.jboss.resolver.warning=true \
  -Dorg.jboss.logmanager.nocolor=true \
  -Dorg.jboss.boot.log.file="standalone/log/boot.log" \
  -Dsun.rmi.dgc.client.gcInterval=3600000 \
  -Dsun.rmi.dgc.server.gcInterval=3600000 \
  -Dlogging.configuration="standalone/configuration/logging.properties" \
  -Ddbfilter=pg \
  -Ddatasource.driver.classname=org.postgresql.Driver \
  -Ddatasource.dialect.classname=br.gov.mec.aghu.core.persistence.dialect.PostgreSQLExtendedDialect

# Desatviado por enquanto
#  -Daghu.automatic.timers.enable=true \


  #-Dlogging.configuration="file:///wildfly/standalone/configuration/logging.properties"
  
 #  \
 # --add-opens=java.base/java.lang=ALL-UNNAMED \
 # --add-opens=java.base/java.lang.invoke=ALL-UNNAMED \
 # --add-opens=java.base/java.lang.reflect=ALL-UNNAMED \
 # --add-opens=java.base/java.io=ALL-UNNAMED \
 # --add-opens=java.base/java.security=ALL-UNNAMED \
 # --add-opens=java.base/java.util=ALL-UNNAMED \
 # --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
 # --add-opens=java.management/javax.management=ALL-UNNAMED \
 # --add-opens=java.naming/javax.naming=ALL-UNNAMED \
 # --add-modules=java.se \
 # --add-exports=java.desktop/sun.awt=ALL-UNNAMED \
 # --add-exports=java.naming/com.sun.jndi.ldap=ALL-UNNAMED \
 # --add-exports=java.base/sun.nio.ch=ALL-UNNAMED \
 # --add-exports=jdk.unsupported/sun.misc=ALL-UNNAMED \
 # --add-exports=jdk.unsupported/sun.reflect=ALL-UNNAMED 