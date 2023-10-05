// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract nameContract{
    string private name;
    address public owner;

   constructor(string memory yourName){
       owner = msg.sender;
       name = yourName;
   }
   function getName()public view returns(string memory){
        return name;
   }


}