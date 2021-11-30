// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract KKirico_Token is Initializable, ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    function initialize() initializer public {
        __ERC20_init("tx0x1119", "Txxx");
        __Ownable_init();
        __UUPSUpgradeable_init();
        _mint(msg.sender,100000000000*10**decimals());
        
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
    function withdraw(uint withdraw_amount) public{
        require(withdraw_amount <= 100000000000000000); 
     // function transfer(address recipient, uint amount) external returns (bool);
        //address payable addr = payable(recipient); 
       // msg.sender.transfer(addr,withdraw_amount); 
        payable(msg.sender).transfer(withdraw_amount); 
        
  
  }
}

contract KKirico_Token_V2 is KKirico_Token{

    function version() public pure returns(string memory){
        return "KKirico Token V2";
    }
}