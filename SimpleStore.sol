pragma solidity ^0.4.18;
contract SimpleStore {
  function SimpleStore(uint _value) public {
    value = _value;
  }

    function set(uint newValue) public {
        value = newValue;
    }

    function get() public constant returns (uint) {
        return value;
    }

    uint value;
}

