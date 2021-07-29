FROM hyperledger/besu

USER root

WORKDIR /opt/besu

RUN mkdir -m 777 -p /home/besu/data

COPY ./config/genesis.json /home/besu/genesis.json

VOLUME ["/home/besu/data"]

EXPOSE 30303/tcp 8545/tcp 8546/tcp

ENTRYPOINT ["besu", "--genesis-file=/home/besu/genesis.json", "--data-path=/home/besu/data", "--rpc-http-api=ETH,NET,WEB3,TRACE,TXPOOL,MINER,DEBUG", "--rpc-http-cors-origins=all", "--rpc-http-enabled"]

