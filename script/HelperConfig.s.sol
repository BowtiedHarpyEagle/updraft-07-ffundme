// SPDX-License-Identifier: MIT

// 1. Deploy mocks on local anvil chain
// 2. Keep track of contract addresses on different chains
// Sepolia ETH/USD price feed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
// Mainnet ETH/USD price feed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";

contract HelperConfig is Script {
    // If on local blockchain, deploy mocks
    // if on a live chain, use the contract addresses for price feed
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; //ETH/USD price feed address
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1) {
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        // price feed address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });

        return sepoliaConfig;
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
        // price feed address: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        NetworkConfig memory mainnetConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });

        return mainnetConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // price feed address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });

        return anvilConfig;
    }
}
