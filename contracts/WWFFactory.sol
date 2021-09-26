pragma solidity >=0.8.4;

import "@openzeppelin/contracts/ownership/Ownable.sol";
import "./WWFSpcies.sol";

contract WWFFactory is Ownable {

  address private _speciesBase;
  mappping(address => uint) _maxAmount; 
  // should we account for species name in the factory ? 
  constructor(address _speciesTemplate) {
    _speciesBase = _speciesTemplate;
  }

  function createSpecies(uint _maxAmount) public onlyOwner returns (address) {
    WWSpecies s = new WWFSpecies();
    _maxAmount[s.address] = _maxAmount;
    return s.address;
  }

  function withdrawAll() external onlyOwner {

  }
}
