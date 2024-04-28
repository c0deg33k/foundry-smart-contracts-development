// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract ChainConfig is Script{
    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkChain {
        address priceFeed;
    }
    NetworkChain public activeNetworkChain;

    constructor(){
        if (block.chainid == 11155111){
            activeNetworkChain = getSepoliaEthConfig();
        } else if ((block.chainid == 1)){
            activeNetworkChain = getMainnetEthConfig();
        }
        else {
            activeNetworkChain = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns(NetworkChain memory){
        // SEPOLIAETH priceFeed Address
        NetworkChain memory sepoliaEthConfig = NetworkChain({priceFeed:0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return sepoliaEthConfig;
    }

    function getMainnetEthConfig() public pure returns(NetworkChain memory){
        // Mainnet ETH priceFeed Address
        NetworkChain memory mainnetEthConfig = NetworkChain({priceFeed:0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
        return mainnetEthConfig;
    }

    function getAnvilEthConfig() public returns(NetworkChain memory){
        if (activeNetworkChain.priceFeed != address(0)){
            //Return the PriceFeed address if already set
            return activeNetworkChain;
        }
        // Deploy mock aggregator contract
        vm.startBroadcast();
        //Get contract address(PriceFeed address)
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
        vm.stopBroadcast();
        //Set the PriceFeed address to be contract address
        NetworkChain memory anvilEthConfig = NetworkChain({priceFeed:address(mockPriceFeed)});
        //Return the PriceFeed address
        return anvilEthConfig;

    }
}