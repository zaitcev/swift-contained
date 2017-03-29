# Initial creation of rings ONLY. Rings are to be updated in-plance!
# This is a SAIO ring with 3-replication for Docker practice.
#
# N.B. Not setting the random seed, all the volumes will be scrambled.

swift-ring-builder object.builder create 12 9 1

swift-ring-builder object.builder add -r 1 -z 1 -i 127.0.0.1 -p 6200 -d s1 -w 100
swift-ring-builder object.builder add -r 1 -z 2 -i 127.0.0.1 -p 6200 -d s2 -w 100
swift-ring-builder object.builder add -r 1 -z 3 -i 127.0.0.1 -p 6200 -d s3 -w 100
swift-ring-builder object.builder add -r 1 -z 4 -i 127.0.0.1 -p 6200 -d s4 -w 100

swift-ring-builder object.builder rebalance

swift-ring-builder container.builder create 12 9 1
swift-ring-builder container.builder add -r 1 -z 1 -i 127.0.0.1 -p 6201 -d s1 -w 100
swift-ring-builder container.builder add -r 1 -z 2 -i 127.0.0.1 -p 6201 -d s2 -w 100
swift-ring-builder container.builder add -r 1 -z 3 -i 127.0.0.1 -p 6201 -d s3 -w 100
swift-ring-builder container.builder add -r 1 -z 4 -i 127.0.0.1 -p 6201 -d s4 -w 100
swift-ring-builder container.builder rebalance

swift-ring-builder account.builder create 12 9 1
swift-ring-builder account.builder add -r 1 -z 1 -i 127.0.0.1 -p 6202 -d s1 -w 100
swift-ring-builder account.builder add -r 1 -z 2 -i 127.0.0.1 -p 6202 -d s2 -w 100
swift-ring-builder account.builder add -r 1 -z 3 -i 127.0.0.1 -p 6202 -d s3 -w 100
swift-ring-builder account.builder add -r 1 -z 4 -i 127.0.0.1 -p 6202 -d s4 -w 100
swift-ring-builder account.builder rebalance
