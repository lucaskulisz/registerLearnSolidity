// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract registerAcces{
    string[]private info;
    address public owner;
    mapping(address=>bool) public whiteList;
    constructor(){
        owner=msg.sender;
        whiteList[msg.sender]= true;
    }
    event InfoChange(string oldInfo, string newInfo);

    modifier onlyOwner {
        require(msg.sender==owner, "only owner") ;
          _;
    }
    modifier onlyWhiteList{
        require(whiteList[msg.sender]==true, "only whitelist");
          _;
    }
    
    function getInfo(uint index)public view returns (string memory){
        return info[index];
    }
    function setInfo(uint index,string memory _info) public onlyWhiteList  {
       emit InfoChange(info[index], _info);
       info[index]=_info;
    }
    function addInfo(string memory _info) public onlyWhiteList returns (uint index){
       info.push(_info);
       index=info.length-1;
    }
    function listInfo()public view returns (string[] memory){
        return info;
    }
    function addMember(address _member)public onlyOwner{
        whiteList[_member]=true;
    }
    function delMember(address _member)public onlyOwner{
        whiteList[_member]=false;
    }

}