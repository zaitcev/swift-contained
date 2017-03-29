FROM centos

# docker build -t saio-1 .
# docker run -i -t --entrypoint bash saio-1
# docker run -i -t -v /run/systemd/journal/dev-log:/dev/log -p 8080:8080 saio-1

RUN yum install -y https://www.rdoproject.org/repos/rdo-release.rpm
# RUN yum update -y
RUN yum install -y openstack-swift-proxy openstack-swift-account openstack-swift-container openstack-swift-object memcached rsync

COPY swift.conf /etc/swift/
COPY account-server.conf container-server.conf object-server.conf \
 proxy-server.conf \
 container-reconciler.conf \
   /etc/swift/

COPY rsyncd.conf /etc/

COPY run.sh /usr/local/bin/run.sh

# Not used for operations - rebuilds from scratch, should we ever want it.
COPY makerings.sh /root/makerings.sh

COPY account.ring.gz account.builder \
 container.ring.gz container.builder \
 object.ring.gz object.builder \
   /etc/swift/

RUN mkdir -p /srv/node/s1 /srv/node/s2 /srv/node/s3 /srv/node/s4
RUN chown swift:swift /srv/node/s1 /srv/node/s2 /srv/node/s3 /srv/node/s4
VOLUME /srv/node/s1
VOLUME /srv/node/s2
VOLUME /srv/node/s3
VOLUME /srv/node/s4

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/run.sh"]
