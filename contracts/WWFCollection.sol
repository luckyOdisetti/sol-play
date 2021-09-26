pragma solidity >=0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract WWFCollection is ERC1155 {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenId;
    Counters.Counter private _collectionId;

    uint256 constant MAX_TOKENS = 1000;
    uint256 constant MAX_AMOUNT_PER_MINT = 5;

    struct Token {
        uint256 tid;
        string name;
        string metadataUri;
    }

    struct Collection {
        uint256 cid;
        string name;
    }

    Token _token;
    string public name;

    mapping(address => mapping(uint256 => Token)) public _balances;
    mapping(uint256 => Collection) public _collectionLookUp;

    constructor() {}

    function mint(
        address to,
        uint256 _collectionId,
        string memory uri
    ) public {
        uint256 id = _tokenId.current();
        _tokenId.increment();
        // lookup species name from collectionId
        // maybe we dont need to store the name on the contract
        Token memory t = Token({ tid: id, name: "rhino", metadataUri: uri });
        _balances[to][id] = t;
    }

    function BalanceOf(address addr, uint256 tokenid) public returns (Token memory) {
        return _balances[addr][tokenid];
    }

    function getCollection() public view returns (uint256) {}

    function createCollection(uint256 _count, string memory _name) public {
        uint256 id = _collectionId.current();
        _collectionId.increment();
        _collectionLookUp[id] = Collection({ cid: id, name: _name });
    }
}
