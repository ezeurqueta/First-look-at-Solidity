pragma solidity >=0.7.0<0.9.0;

contract myGame {
    mapping (address => Player)public players;

    enum Level {Novice, Intermediate, Advanced}  //Encierra las variables para que solo acepte algunas que pones aca

    struct Player{
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }


    function addPlayer(string memory firstName, string memory lastName) public{
        players[msg.sender] = Player(msg.sender,Level.Novice,firstName,lastName);
    }

    function getPlayerLevel(address playerAddress) public view returns(Level){
        return players[playerAddress].playerLevel;
    }
}


