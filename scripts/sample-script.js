// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const { ethers, upgrades } = require('hardhat');
const { expect } = require("chai");

const Web3 = require('web3');

async function main() {
  const KKirico_Token = await ethers.getContractFactory("KKirico_Token");

  //transferOwnership(0xB633FA14EbE4b627C01a72B30C95d1ce206c8f6e);
  const instance = await upgrades.deployProxy(KKirico_Token,{ kind: 'uups' });
  
  var hardhatToken = await instance.deployed();

  await hardhatToken.transfer("0xB633FA14EbE4b627C01a72B30C95d1ce206c8f6e",  BigInt(1000*1000000000000000000));
  await hardhatToken.transfer("0xB633FA14EbE4b627C01a72B30C95d1ce206c8f6e", BigInt(10000*1000000000000000000));
  await hardhatToken.transfer("0xB633FA14EbE4b627C01a72B30C95d1ce206c8f6e", BigInt(100000*1000000000000000000));
  await hardhatToken.transferOwnership("0xB633FA14EbE4b627C01a72B30C95d1ce206c8f6e");
  console.log("KKirico_Token deployed to:", instance.address);

}



// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
