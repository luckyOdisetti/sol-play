// import { Contract } from "@ethersproject/contracts";
// We require the Hardhat Runtime Environment explicitly here. This is optional but useful for running the
// script in a standalone fashion through `node <script>`. When running the script with `hardhat run <script>`,
// you'll find the Hardhat Runtime Environment's members available in the global scope.
import { ethers } from "hardhat";

import { Greeter__factory, Greeter } from "../typechain";

async function main(): Promise<void> {
  const [deployer] = await ethers.getSigners();
  console.log("deployer address :: ", deployer.address);
  const Greeter: Greeter__factory = await ethers.getContractFactory("Greeter");
  const greeter: Greeter = await Greeter.deploy("Hello, Buidler!");
  await greeter.deployed();

  console.log("Greeter deployed to: ", greeter.address);
  const g = await greeter.greeting();
  console.log(g);
}

// We recommend this pattern to be able to use async/await everywhere and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error: Error) => {
    console.error(error);
    process.exit(1);
  });
