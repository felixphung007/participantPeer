set -ev
# don't rewrite paths for Windows Git Bash users
export MSYS_NO_PATHCONV=1docker-compose -f docker-compose-peer.yml down
docker-compose -f docker-compose-peer.yml up -d peer1.org1.example.com couchdb1export FABRIC_START_TIMEOUT=10
#echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}# Create the channel
docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer1.org1.example.com peer channel fetch config -o orderer.example.com:7050 -c mychanneldocker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer1.org1.example.com peer channel join -b mychannel_config.block