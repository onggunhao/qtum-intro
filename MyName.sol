pragma solidity ^0.4.18;
contract MyName {
  function MyName(string _name) public {
    name = _name;
  }

    function set(string newName) public {
        name = newName;
    }

    function get() public constant returns (name) {
        return name;
    }

    string name;
}

