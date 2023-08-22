// SPDX-License-Identifier: MIT 
// always add the identifier at the top
pragma solidity ^0.8.7; // comment and solidity version the asterick on the top is to tell solidity that any version above that can be used 

contract SimpleStorage{
    // boolean;true or false, uint: positive whole number, int, address, bytes
   // uint8-256 to show number of bits or storage
   // string is text "a string"
   //int can be positive or negative
   //address is you wallet address
   //byte max size is 32

   // this gets initialized as zero
   uint256  favoriteNumber;
   // if you do not identify the visibility as public, private
   //internal or external it automatically initialized as internal
    // People public person = People({ favoriteNumber: 20 , name: "kevin" });
    mapping (string => uint256) public nameToFavouriteNumber;
    // itis saying the string name is being mapped/marked to the uint256  fav number
    

    struct People{
        uint256 favoriteNumber;
        string name;
    }
//    this is a dynamic array because it does not have the number of items in the array specified i.e People[3]
    People[] public people;
    // fixed array People[4] 4 items in this array

   function store(uint256 favNUm) public{
       favoriteNumber = favNUm;
        // favoriteNumber = favoriteNumber +1; the more things you do the more expensive gas
       //0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
   }

   function retrieve() public view returns (uint256){
       return favoriteNumber;
   }

// calldata, memory, storage
// calldata and memory are temporary storage values
// calldata is temp data that cannot be modified
// memory is temp data that can be modified
// storage is permanent value that can be modified
// struct, mapping, or array need to be either calldata or memory
    function addPerson( string memory _name, uint256 favNum) public{
        People memory newPerson = People({favoriteNumber: favNum , name : _name });
        people.push(newPerson);
        nameToFavouriteNumber[_name] = favNum;
    }
}

