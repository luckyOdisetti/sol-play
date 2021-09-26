// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract RollSpeed is ERC1155, ERC1155MetadaURI {
    using Counters for Counters.Counter;
    using Address for address;
    using Strings for uint256;

    address public owner;
    mapping(address => mapping())

    mapping(address => mapping(uint256 => uint256)) private _balances;

    constructor() {
      // do we want to override mappers here 
        owner = msg.sender;
    }

    _mint(){
      // override to implement fair mints
      // override to limit number of tokens minted
      // do we want to limit number of tokens an address can own 
    }

    _mintBatch(){
      // do we want to override this ? 
    }

    _burn(){}
    _burnBatch(){}

    _beforeTokenTransfer(){
      // royalty stuff here ? 
    }

    createCollection() public {
      // should take in 
    }
}
