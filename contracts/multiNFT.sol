// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract multiNFT is ERC721, ERC721URIStorage {
    using Strings for uint256;
    
    uint256 private _nextTokenId=0;
    address public owner;

    constructor()
        ERC721("MultipleNFTs", "MNFTs")
        
    {
        owner=msg.sender;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://aqua-gigantic-lungfish-89.mypinata.cloud/ipfs/QmSY9mZpcG6HDf4dtgGHSrv66VQRiqn2EVMGRbkEzp2gv5/";
    }

    function safeMint(address to) public  {
        uint256 tokenId = ++_nextTokenId;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        string memory base = _baseURI();
        
        // return string.concat(base, tokenId.toString(),".json");
        return string.concat(base, Strings.toString(tokenId),".json");
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
