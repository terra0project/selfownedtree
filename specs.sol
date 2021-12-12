pragma solidity ^0.8.0;

// standart nft infterface which will be provided by standart openzeppelin implementation
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract SelfownedTree is ERC721Enumerable, Ownable{
    //the address of the current caretaker e.g the museum
    address current_caretaker;
    //the blocknumber where the last certificate was minted
    uint blocknumber_last_certificate;
    //the blocknumber where the contract was deployed
    uint blocknumber_depolyment;
    // number of certificates minted
    uint number_of_certificates;
    //the address of the current tax_office lol
    address tax_office;
    //the address of the guardians - e.g terra0 multisig
    address guardiens;

    // This function will check how much time has passed and issue the caretaker certificates
    // this is the only function which the museum can call periodicly 
    function mint_certificate()public view {}

    // this function will check how much certificates can be minted to the current caretaker
    // should be called from mint_certificate()
    function calculate_number_of_certs()internal returns (uint cert_numbers) {}

    // function to calculate how much time has passed
    // should be called from calculate_number_of_certs()
    function check_time()internal returns (uint cert_numbers) {}
 
    // this function can be called by anyone - it initalize a process of verifing if the caretaking took place
    // this can either happen through reality.eth or throug the terra0 multisig
    // the stake of the caller gets burned if caretaking took place
    // if the caretaking didn't took place the guardien has to select a new caretaker - both the guardien and the challenger will be able to mint new certificates
    function challenge_caretaker(uint stake) public {}

    // this function can only be called by the guardians and changes the address of the caretaker
    function change_caretaker(address new_caretaker) public {}

    //create the certificate in svg here / overrides the nafive function
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {}
}



