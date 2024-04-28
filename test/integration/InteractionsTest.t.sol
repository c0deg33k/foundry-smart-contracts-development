// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interaction.s.sol";

contract FundMeTestIntegration is Test{
    FundMe public fundMe;
    address USER = makeAddr("user");
    uint256 constant ETHER_AMOUNT = 0.1 ether;
    uint256 constant STARTING_BALANCE = 100 ether;

    function setUp () external{
        //fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);        
    }

    function testUserCanFundInteraction () public{
        FundFundMe fundFundMe = new FundFundMe(); 
        console.log("User Address: %s", USER);
        fundFundMe.fundFundMe(address(fundMe));
        console.log("Funder: %s", fundMe.getFunder(0));
        //assertEq(fundMe.getFunder(1), USER);
    }

    function testUserCanWithdrawInteraction () public{
        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));
        assertEq(address(fundMe).balance, 0);
    }
}