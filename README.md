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

We will be writing the most simple smart contract, that saves a single value to
the QTUM blockchain.

In the terminal window with docker running, create the following file (using
vi, nano etc) and save it as MyName.sol

```
pragma solidity ^0.4.18;
contract MyName {
  function MyName(string _name) public {
    myName = _name;
  }

    function set(string newName) public {
        myName = newName;
    }

    function get() public constant returns (string) {
        return myName;
    }

    string myName;
}
```

### 4. Creating an address to deploy smart contract from

##### Create an address
```
> qcli getnewaddress
```

##### Send a transaction!
```
> qcli sendtoaddress <address> <amount>
<returns transaction id>

e.g. 
> qcli sendtoaddress qdiqg2mp646KhSQjVud3whv6C34hNHQnL2 10
11e790d26d6996803960ef1586cbaeb54af20fd3e1f41508843c36f2ef60bb9d
```

##### Get transaction information
```
> qcli gettransaction 11e790d26d6996803960ef1586cbaeb54af20fd3e1f41508843c36f2ef60bb9d
```

##### Get balance of the address
```
qcli listunspent 1 99999 '["qdiqg2mp646KhSQjVud3whv6C34hNHQnL2"]'
```

##### Configure Solar (deployment tool) to use address as sender
```
export QTUM_SENDER=qdiqg2mp646KhSQjVud3whv6C34hNHQnL2
```

### 4. Deploying smart contract to QTUM (qcli, solar)

```
solar deploy MyName.sol '["Adam"]'
```

```
solar status
```

You can see more about the deployed contracts in ```solar.development.json```

### 5. Using QTUM ABI explorer to interact with QTUM smart contract

Open up a window in http://localhost:9899/abiplay

Load the `solar.development.json` file into the `abiplay` and you can see the
list of available methods.

Set the new variable in SimpleStore

Approve it at http://localhost:9899, because this costs QTUM. 
