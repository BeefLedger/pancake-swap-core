pragma solidity ^0.7.0;

contract BasicEns {
    mapping (bytes32 => address) _records;
    address _owner;

    constructor(address owner) {
        _owner = owner;
    }

    function addr(bytes32 node) public view returns (address) {
        return _records[node];
    }

    function getOwner() public view returns (address) {
        return _owner;
    }

    function setAddr(bytes32 node, address nodeAddr) public mustOwn {
        _records[node] = nodeAddr;
    }

    function resolver(bytes32) external view returns (address) {
        return address(this);
    }

    modifier mustOwn {
        require(msg.sender == _owner, "Must be the owner");
        _;
    }
}
