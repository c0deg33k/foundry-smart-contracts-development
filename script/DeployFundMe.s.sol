// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {ChainConfig} from "./ChainConfig.s.sol";

contract DeployFundMe is Script{
    
    function run() external returns(FundMe){
        ChainConfig chainConfig = new ChainConfig();
        
        vm.startBroadcast();
        FundMe fundMe = new FundMe(chainConfig.activeNetworkChain());
        vm.stopBroadcast();
        return fundMe;
    }
}