pragma solidity >=0.7.0<0.9.0;

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event RecordSent(address from, address to, uint amount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver,uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver2, uint amount2) public {
        require(amount < balances[msg.sender],"ERROR__Insufficent balance__ERROR");
        balances[msg.sender] -= amount;
        balances[receiver]+=amount;
        emit RecordSent(msg.sender, receiver, amount);
    }
}