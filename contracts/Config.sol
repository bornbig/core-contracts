pragma solidity >=0.7.0 <0.8.0;

contract PTMConfig {
    mapping(string => address) public config;

    function setConfig(string memory _key, address _value) public {
        config[_key] = _value;
    }
}
