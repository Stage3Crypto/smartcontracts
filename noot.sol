//Kyle Sponable
//CTO & Co-Founder 
//Stage3crypto.com
//This smart contract mints NOOTS!!!! 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NootTest is ERC721, ERC721URIStorage, Ownable {
    constructor() ERC721("NootTest", "NoTT") {}

      function mint(uint256 quantity) onlyOwner external payable {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
      
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://nftstorage.link/ipfs/bafybeicdrlx4hkxpspak3bu73m5omlup7iyjqkf32mxhnnuub7uxahwquy";
    } ipfs://bafybeicdrlx4hkxpspak3bu73m5omlup7iyjqkf32mxhnnuub7uxahwquy

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}

