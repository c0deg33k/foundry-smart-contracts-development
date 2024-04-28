// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";


contract FundFundMe is Script {
    uint256 public constant ETHER = 10 ether;
    
    function fundFundMe(address mostRecentlyDeployed) public {
        console.log("Recent Contract Address: %s", mostRecentlyDeployed);
        console.log("Msg.Sender: %s", msg.sender);
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).fund{value: ETHER}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s ether", ETHER);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        //vm.startBroadcast();
        fundFundMe(mostRecentlyDeployed);
        //m.stopBroadcast();
    }
}


contract WithdrawFundMe is Script {
    
    function withdrawFundMe(address mostRecentlyDeployed) public {
        
        vm.startBroadcast();
        uint256 balance = mostRecentlyDeployed.balance;
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
        console.log("Withdrawn %s eth from FundMe.", balance);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeployed);
    }
}