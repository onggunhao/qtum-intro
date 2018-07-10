# Introduction to QTUM

This is a simple 90 minute tutorial on QTUM and a hands-on tutorial on how to
write your name to a smart contract on the QTUM blockchain. 

## Part 1: Overview of Blockchains and QTUM

Slides can be found here
https://github.com/onggunhao/qtum-intro/raw/master/new_qtum_prezi_v2.1.1.pdf

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
![Solar
Deploy](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/solar-deploy.png)

```
solar status
```
![Solar
status](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/solar-status.png)

You can see more about the deployed contracts in ```solar.development.json```

### 5. Using QTUM ABI explorer to interact with QTUM smart contract

##### GUI for interacting with smart contracts

QTUM has a GUI for interacting with smart contracts. You can find this at http://localhost:9899/abiplay

![QTUM ABI Play](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/qtum-abi-player.png)

##### Load solar.deployment.json

For the contracts that have been deployed, a solar.deployment.json file is
created. This allows the ABI Play to interact with the public methods of the
smart contract (in our case, get and set)

![Load solar.deployment.json](https://github.com/onggunhao/qtum-intro/blob/master/img/qtum-abi-select-file.png) 

##### Get data (i.e. name) from the blockchain

Use the 'get' method to get your name from the blockchain. When you
`call` a function, you do not have to send a transaction. 

![Get submit
screen](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/abi-get-call-screen.png)
![Get name](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/qtum-abi-get.png)

##### Send data to the blockchain

We are going to use the `set` function to change the name, by sending a new
transaction to the blockchain. 

![Submit new
name](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/abi-set-submit.png)

After clicking send, you'll see that the transaction is waiting for
authorization. This is because it costs QTUM.

![Awaiting authorization](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/abi-set-await-authorization.png)

##### Approving a transaction

To approve a transaction, go to the transaction authorization UI at
http://localhost:9899.

![Portal Authorizations](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/portal-authorizations.png) 

It'll take some time for the blockchain transaction to be approved, but you
will eventually see the success screen with the details of the transaction.

![Success set
screen](https://raw.githubusercontent.com/onggunhao/qtum-intro/master/img/qtum-abi-set.png)

### Further learning

To learn more, please visit https://book.qtum.org/en/ for the full tutorial.
Happy learning!
