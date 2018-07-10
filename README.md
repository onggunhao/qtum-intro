# Introduction to QTUM

This is a simple 90 minute tutorial on QTUM and a hands-on tutorial on how to
write your name to a smart contract on the QTUM blockchain. 

## Part 1: Overview of Blockchains and QTUM


## Part 2: Hands on Practice

### 1. Installing Docker Community Edition

Install the Docker Community Edition on your Mac/Windows/Linux computer using
the instructions at the following link:

https://docs.docker.com/v17.09/engine/installation/linux/docker-ce/ubuntu/

### 2. Pulling the QTUM Docker image

```
[sudo] docker pull hayeah/qtumportal:latest
```

### 3. Starting the QTUM docker image

In the first tab, we will run QTUM in regtest mode (basically a local QTUM
blockchain that you can play around with)

```
> docker run -it --rm \
  --name myapp \
  -v `pwd`:/dapp \
  -p 9899:9899 \
  -p 9888:9888 \
  hayeah/qtumportal
```

In a second tab, we will enter the QTUM docker shell. Please type all
additional instructions into this shell.

```
> docker exec -it myapp sh
```

### 4. Play around with QTUM!

This generates 600 blocks of QTUM. We need 600 blocks because QTUM block
rewards take 500 blocks to receive the full amount (see
https://book.qtum.org/en/part1/qtum-docker.html#new-blocks-on-demand for full
explanation)

##### Generate some QTUM tokens for yourself:
```
> qcli generate 600
```

##### Check your balance
```
> qcli getbalance
```

##### Check number of blocks you have
```
> qcli getblockchaininfo
> qcli getwalletinfo
> qcli getnetworkinfo
```

### 3. Writing a simple smart contract in solidity
### 4. Deploying smart contract to QTUM (qcli, solar)
### 5. Using QTUM ABI explorer to interact with QTUM smart contract


