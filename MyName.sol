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

