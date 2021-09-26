pragma solidity >=0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Afm is ERC1155 {

    const constant MAX_PER_MINT = 5;
    const private maxSupply;
    
    mapping(uint256 => mapping(address => uint256)) _balances;
    mapping(address => mapping(address => bool)) _operatorApproval;
    
    constructor(uint _maxSupply){
        maxSupply = _maxSupply;
    }
    
     function balanceOf(address account, uint256 id) public view virtual override returns (uint256) {
        require(account != address(0), "ERC1155: balance query for the zero address");
        return _balances[id][account];
    }
    
    function balanceOf(address acc, uint256 id) public view override (uint256) {
        require(account != address(0), "Zero address entered");
        return _balances[id][acc];
    }
    
    function mint() public {
        
    }
    
    
}