#!/bin/sh
### BEGIN INIT INFO
# Provides: glassfish
# Required-Start: $local_fs $remote_fs $network
# Required-Stop: $local_fs $remote_fs $network
# Should-Start: $named # Should-Stop: $named
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start Glassfish Server
# Description: Start the Glassfish J2EE Server
### END INIT INFO
# customize values for your needs
NAME=glassfish

test -r /etc/default/glassfish && . /etc/default/glassfish

if [ -z "$GF_VERSION" ]; then
  GF_VERSION="glassfish3"
fi

GLASSFISH_USER=glassfish
GLASSFISH_DIR="{{ glassfish_home }}/${GF_VERSION}"
ASADMIN="$GLASSFISH_DIR/glassfish/bin/asadmin"

if [ -z "$GF_DOMAIN" ]; then
  GF_DOMAIN="domain1"
fi

case "$1" in
  start )
    /bin/su $GLASSFISH_USER -s /bin/bash -c "$ASADMIN start-domain --domaindir $GLASSFISH_DIR/glassfish/domains $GF_DOMAIN"
    ;;

  stop )
    /bin/su $GLASSFISH_USER -s /bin/bash -c "$ASADMIN stop-domain --domaindir /$GLASSFISH_DIR/glassfish/domains $GF_DOMAIN"
    ;;

  restart )
    /bin/su $GLASSFISH_USER -s /bin/bash -c "$ASADMIN restart-domain --domaindir $GLASSFISH_DIR/glassfish/domains $GF_DOMAIN"
    ;;

  * )
    echo "usage: $0 (start|stop|restart|help) domain"
    ;;
esac
