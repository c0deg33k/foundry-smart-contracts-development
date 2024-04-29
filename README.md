<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/c0deg33k/foundry-smart-contracts-development">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">foundry-smart-contracts-development</h3>

  <p align="center">
    project_description
    <br />
    <a href="https://github.com/c0deg33k/foundry-smart-contracts-development"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/c0deg33k/foundry-smart-contracts-development">View Demo</a>
    ·
    <a href="https://github.com/c0deg33k/foundry-smart-contracts-development/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/c0deg33k/foundry-smart-contracts-development/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <ul>
        <li><a href="#deploying">Deploying</a></li>
        <li><a href="#testing">Testing</a></li>
        <li><a href="#verifying">Verifying</a></li>
      </ul>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project


This project is a crowd-funding application built using Solidity and Foundry. The application allows users to create and fund projects, with the funds being held in a smart contract until the project's funding goal is met. Once the goal is met, the funds are released to the project creator. If the goal is not met, the funds are returned to the backers.

The project is built using the Foundry development framework, which provides a suite of tools for building, testing, and deploying smart contracts on the Ethereum blockchain. The smart contracts are written in Solidity, a popular programming language for Ethereum.

The project includes a Makefile for automating common tasks, such as compiling and testing the smart contracts. The project also includes a suite of tests, which can be run using the Foundry testing framework.

The project is designed to be easy to use and understand, with clear documentation and a simple, intuitive interface. The project is also designed to be secure, with all funds being held in a smart contract that has been thoroughly tested and audited.

Overall, this project is a great example of how smart contracts can be used to build decentralized applications that are secure, transparent, and easy to use. Whether you're a developer looking to learn more about smart contract development, or a user looking for a reliable crowd-funding platform, this project is a great place to start.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Solidity][Solidity.com]][Solidity-url]
* [![Foundry][Foundry.com]][Foundry-url]
* [![Makefile][Makefile.com]][Makefile-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

You'll need,
* Visual Studio Code
  Download and install VScode from [code.visualstudio.com](https://code.visualstudio.com/download)
  - Install the following extensions:
  * Solidity
  * Even Better Toml
  * Prettier-Code formatter
* Foundry
  Get the latest version of Foundry
  ```sh
  curl -L https://foundry.paradigm.xyz | bash
  ```

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/c0deg33k/foundry-smart-contracts-development.git
   ```
2. cd into the repo
   ```sh
   cd foundry-smart-contracts-development
   ```
3. Compile the project
   ```sh
   forge compile
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

### Deploying the contract
1. Install Metamask extension on your browser and create a new account.
   * Get testnet ETH
     - Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

2. Create a SepoliaETH test application on [Alchemy](https://www.alchemy.com/) and get your API key.
3. Create a ```.env``` file in your project root directory and add your Sepolia RPC URL, private key, and Etherscan API key as follows:
    ```makefile
      API_URL=<your_sepolia_rpc_url>
      PRIVATE_KEY=<your_metamask_account_private_key> ## NEVER INCLUDE A PRVATE KEY WITH YOUR CRYPTO ASSETS. USE A TEST WALLET PRIVATE KEY.
      ETHERSCAN_API_KEY=<your_etherscan_api_key>
   ```
   * Run the following terminalcommand to initiate the ```.env```
    ```sh
    source .env
    ```
4. Deploy the contract to Sepolia testnet
   ```sh
   forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast
   ```
### Verifying the contract
Add your `ETHERSCAN_API_KEY` to verify your contract on [Etherscan](https://etherscan.io/).
1. Deploy the contract to Sepolia testnet with the etherscan API Key.
   ```sh
   forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
   ```

### Interacting with the contract
After deploying to a testnet or local net, you can run the following scripts. 

Using cast deployed locally fund the contract using: 

```sh
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or alternatively run the Interactions script
```sh
forge script script/Interactions.s.sol --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```
Withdraw assets sent to the contract

```sh
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

Estimate gas spent

```sh
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

Run code formatting:
```sh
forge fmt
```


### Testing
To run all tests, run the following command
```sh
forge test
```
or
```sh
forge test --match-test <TEST_NAME>
```
to run a single test


### Debugging
Get Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
To get more verbosity as you test run test commands with `-v`
```sh
forge test -vvv
```
or
```sh
forge test --match-test <TEST_NAME> -vvvv
```
The more the `v`(1-5) the more verbose the output.

_For more examples, please refer to the [Foundry Documentation](https://book.getfoundry.sh/)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Cyfrin Updraft](https://updraft.cyfrin.io/courses)
* [Best-README-Template](https://github.com/othneildrew/Best-README-Template/tree/master)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Author - [@c0deg33k](https://twitter.com/c0deg33k)

Project Link: [https://github.com/c0deg33k/foundry-smart-contracts-development](https://github.com/c0deg33k/foundry-smart-contracts-development)


[![c0deg33k Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/c0deg33k)
[![c0deg33k Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/clinton-kariuki/)
<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/c0deg33k/foundry-smart-contracts-development.svg?style=for-the-badge
[contributors-url]: https://github.com/c0deg33k/foundry-smart-contracts-development/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/c0deg33k/foundry-smart-contracts-development.svg?style=for-the-badge
[forks-url]: https://github.com/c0deg33k/foundry-smart-contracts-development/network/members
[stars-shield]: https://img.shields.io/github/stars/c0deg33k/foundry-smart-contracts-development.svg?style=for-the-badge
[stars-url]: https://github.com/c0deg33k/foundry-smart-contracts-development/stargazers
[issues-shield]: https://img.shields.io/github/issues/c0deg33k/foundry-smart-contracts-development.svg?style=for-the-badge
[issues-url]: https://github.com/c0deg33k/foundry-smart-contracts-development/issues
[license-shield]: https://img.shields.io/github/license/c0deg33k/foundry-smart-contracts-development.svg?style=for-the-badge
[license-url]: https://github.com/c0deg33k/foundry-smart-contracts-development/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/clinton-kariuki
[Solidity.com]: https://img.shields.io/badge/Solidity-000000?style=for-the-badge&logo=solidity&logoColor=white
[Solidity-url]: https://soliditylang.org
[Foundry.com]: https://img.shields.io/badge/Foundry-000000?style=for-the-badge&logo=foundry&logoColor=white
[Foundry-url]: https://getfoundry.sh/
[Makefile.com]: https://img.shields.io/badge/Makefile-000000?style=for-the-badge&logo=makefile&logoColor=white
[Makefile-url]: https://www.gnu.org/software/make/
