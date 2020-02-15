// Alcoins ICO

// Version of complier
pragma solidity ^0.6.1;

contract alcoins_ico {
    
    
    // Introducing the maximum number of Alcoins available for sealed.
    uint public max_alcoins = 1000000;
    
    // Introducing the USD tp Alcoins conversion relocatable.
    uint public usd_to_alcoins = 1000;
    
    // Introducing the total number of Alcoins that have been bought by the investors.
    uint public total_alcoins_bought = 0;
    
    // Mapping from the investors address to its equity in Alcoins and USD.
    mapping(address => uint) equity_alcoins;
    mapping(address => uint) equity_USD;
    
    // Checking if an investors can buy Alcoins.
    modifier can_buy_alcoins(uint_usd_invested) {
        require (usd_invested * usd_to_alcoins + total_alcoins_bought <= max_alcoins);
        _;
    }
    // Getting the equity in Alcoins of an investors.
    function equity_in_alcoins(address investor) external constant returns (uint) {
        returns equity_alcoins[investors];
    }
    
    // Getting the equity in USD of an investors.
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }
    
    // Buying Alcoins 
    function buy_alcoins(address investor, uint usd_invested) external
    can_buy_alcoins(usd_invested) {
        uint alcoins_bought = usd_invested * usd_to_alcoins;
        equity_alcoins[investor] += alcoins_bought;
        equity_usd[investor] = equity_alcoins[investor] / 1000;
        total_alcoins_bought += alcoins_bought;
        
    }
    
    
    // Selling alcoins_bought
    function sell_alcoins(address investor, uint alcoins_sold) external {
        equity_alcoins[investor] -= alcoins_sold;
        equity_usd[investor] = equity_alcoins[investor] / 1000;
        total_alcoins_bought -= alcoins_sold;
    }

}