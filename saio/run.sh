#!/bin/sh

/usr/bin/rsync --daemon

# /usr/bin/memcached -p 11211 -u memcached -m 64 -c 1024 -l 192.168.50.1 &
/usr/bin/memcached -p 11211 -u memcached -m 64 -c 1024 -l 127.0.0.1 &

# Account section
/usr/bin/python2 /usr/bin/swift-account-server /etc/swift/account-server.conf &
/usr/bin/python2 /usr/bin/swift-account-auditor /etc/swift/account-server.conf &
/usr/bin/python2 /usr/bin/swift-account-replicator /etc/swift/account-server.conf &
/usr/bin/python2 /usr/bin/swift-account-reaper /etc/swift/account-server.conf &

# Container section
/usr/bin/python2 /usr/bin/swift-container-server /etc/swift/container-server.conf &
/usr/bin/python2 /usr/bin/swift-container-updater /etc/swift/container-server.conf &
/usr/bin/python2 /usr/bin/swift-container-replicator /etc/swift/container-server.conf &
/usr/bin/python2 /usr/bin/swift-container-auditor /etc/swift/container-server.conf &
# /usr/bin/python2 /usr/bin/swift-container-sync /etc/swift/container-server.conf &

# Object section
/usr/bin/python2 /usr/bin/swift-object-server /etc/swift/object-server.conf &
/usr/bin/python2 /usr/bin/swift-object-replicator /etc/swift/object-server.conf &
/usr/bin/python2 /usr/bin/swift-object-auditor /etc/swift/object-server.conf &
/usr/bin/python2 /usr/bin/swift-object-updater /etc/swift/object-server.conf &
/usr/bin/python2 /usr/bin/swift-object-reconstructor /etc/swift/object-server.conf &

# Proxy section
/usr/bin/python2 /usr/bin/swift-container-reconciler /etc/swift/container-reconciler.conf &
/usr/bin/python2 /usr/bin/swift-object-expirer /etc/swift/object-expirer.conf &

# We use the Proxy server as the root process.
/usr/bin/python2 /usr/bin/swift-proxy-server /etc/swift/proxy-server.conf
