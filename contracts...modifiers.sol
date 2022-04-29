pragma solidity >=0.7.0<0.9.0;

contract Coin{
    address public minter;
    mapping (address => uint) public balances;

    event RecordSent(address from, address to, uint amount);


    modifier onlyMinter{
         require(msg.sender == minter,"Only minter can call this function");
         _;      
    }

    modifier amountGreaterThan(uint amount){
        require(amount < 1e60);
        _;
    }
    modifier balanceGreaterThan(uint amount){
        require(amount < balances[msg.sender],"ERROR__Insufficent balance__ERROR");
        _;
    }

    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver,uint amount) public onlyMinter amountGreaterThan(amount){
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public balanceGreaterThan(amount){
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit RecordSent(msg.sender, receiver, amount);
    }
}