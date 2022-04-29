pragma solidity >=0.7.0<0.9.0;

contract myGame {
    uint public playerCount=0;
    Player[] public players; //Variable llamada players publica que almacena lo que haya en Player en un arreglo
    struct Player{
        string firstName;
        string lastName;
    }


    function addPlayer(string memory firstName, string memory lastName) public{
        players.push(Player(firstName,lastName));
        playerCount+=1;
    }

}






    //uint public constant myUint = 1; // Constant means it cant be altered.
    //int public myInt =-1;
    //string public myString = "my String";
    //bool public myBool = true;