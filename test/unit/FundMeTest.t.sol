// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

contract FundMeTest is Test{
    FundMe fundMe;
    address USER = makeAddr("user");
    uint256 constant ETHER_AMOUNT = 0.1 ether;
    uint256 constant STARTING_BALANCE = 100 ether;
    uint256 constant ETHER_TEST_AMOUNT = 5e18;
    uint256 constant EXPECTED_PRICE_FEED_VERSION = 4;

    function setUp () public{
        //fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE); // Set a user balance for our new sim user
    }
 
    function testMinUsdIsFive () public view{
        assertEq(fundMe.MINIMUM_USD(), ETHER_TEST_AMOUNT);
    }

    function testSenderIsOwner () public view{
        assertEq(fundMe.getOwner(), msg.sender);
    }

    function testPriceFeedVersion () public view{
        assertEq(fundMe.getVersion(), EXPECTED_PRICE_FEED_VERSION);
    }
    
    function testFundingFailsWithoutEnoughETH () public {
        vm.expectRevert();
        // test and expect reverts if someone sends less than 5 USD worth of eth
        fundMe.fund();
    }

    modifier funded () {
        vm.prank(USER); // set up a user to simulate a sending trx
        fundMe.fund{value: ETHER_AMOUNT}();
        _;
    }

    function testFundingUpdatesFundDataStructure () public funded{
        //Using modifier
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, ETHER_AMOUNT);
    }

    function testFunderIsAddedToArray () public funded {
        // check that the funder is added to the array
        assertEq(fundMe.getFunder(0), USER);
    }

    function testOnlyOwnerCanWithdraw () public funded {
        vm.expectRevert();
        fundMe.withdraw();
    }

    function testOwnerWithdrawalFromOneFunder () public funded {
        //Arrange
        uint256 initialOwnerBalance = fundMe.getOwner().balance;
        uint256 initialContractBalance = address(fundMe).balance;

        //Act
        address owner = fundMe.getOwner();
        vm.prank(owner);
        fundMe.withdraw();

        //Assert
        uint256 finalOwnerBalance = fundMe.getOwner().balance;
        uint256 finalContractBalance = address(fundMe).balance;

        assertEq(finalOwnerBalance, initialOwnerBalance + initialContractBalance);
        assertEq(finalContractBalance, 0);
    }

    function testWithdrawalFromMultipleFunders () public funded {
        uint160 totalNumberOfFunders = 10;
        uint160 fundersStartingIndex = 1;
        for (uint160 i = fundersStartingIndex; i < totalNumberOfFunders; i++) {
            hoax(address(i), STARTING_BALANCE);
            fundMe.fund{value: ETHER_AMOUNT}();
        }

        uint256 initialOwnerBalance = fundMe.getOwner().balance;
        uint256 initialContractBalance = address(fundMe).balance;

        address owner = fundMe.getOwner();
        vm.startPrank(owner);
        fundMe.withdraw();
        vm.stopPrank();

        uint256 finalOwnerBalance = fundMe.getOwner().balance;
        uint256 finalContractBalance = address(fundMe).balance;
        
        assertEq(finalOwnerBalance, initialOwnerBalance + initialContractBalance);
        assertEq(finalContractBalance, 0);
    }

}