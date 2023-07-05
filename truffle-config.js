
const HDWalletProvider = require("@truffle/hdwallet-provider");
const privateKey = "0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3"; // replace this with your private key

module.exports = {
  networks: {
    besu: {
      provider: () => new HDWalletProvider(privateKey, "http://localhost:8545"),
      gasPrice: 0,
      gas: 4500000,
      type: "quorum"
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",
    },
  },
};
