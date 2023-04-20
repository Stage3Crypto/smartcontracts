// Kyle Sponable
// CTO & Co-Founder
// Stage3crypto.com
// This smart contract mints NOOTS!!!! 128 Noot In A Suit Noots!!!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NootInASuit is ERC721, Ownable {

    uint256 private _tokenIdCounter = 1;
    uint256 private constant _maxTokens = 128;
    string private constant _baseTokenURI = "Base_URI";

    constructor() ERC721("Name", "Symbol") {
    }

    function mint(uint256 quantity) public onlyOwner {
        require(_tokenIdCounter + quantity <= _maxTokens + 1, "Exceeds maximum tokens available for minting");
        
        _safeMint(msg.sender, 1);

        for (uint256 i = 0; i < (quantity - 1); i++) {
            _tokenIdCounter++;
            _safeMint(msg.sender, _tokenIdCounter);            
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return _baseTokenURI;
    }
}