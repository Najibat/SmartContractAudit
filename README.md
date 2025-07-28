# 🔒 Smart Contract Audit: VulnerablePiggyBank

## 💡 Overview
This project explores vulnerabilities in a basic Ethereum smart contract, demonstrates how they can be exploited, and shows how to secure the contract effectively.

## 🧱 Contracts Included
- `VulnerablePiggyBank.sol`: Original contract with intentional vulnerabilities
- `SecurePiggyBank.sol`: Hardened version with access control and input validation
- `Attacker.sol`: Simulates an exploit against the vulnerable contract

## 🔍 Vulnerabilities Identified
- Unrestricted Access to Withdrawals: Anyone could call `withdraw()` and drain the entire contract balance.
- No Owner Verification: The contract didn't check who was withdrawing.
- Lack of Input Checks: Deposits allowed zero ETH without error.
- Attack Vector: Since `withdraw()` had no restrictions, a malicious contract could drain funds instantly.

## ✅ Security Fixes Implemented
- `require(msg.sender == owner)` added to `withdraw()` to restrict access.
- Prevented zero-value deposits with `require(msg.value > 0)`.
- Events added for `deposit` and `withdraw` for auditability.
- Contracts now use inheritance structure (`VaultBase`, `VaultManager`) in extended versions.

## 💣 Attack Simulation
- The `Attacker` contract calls `withdraw()` on `VulnerablePiggyBank` using its constructor-injected target address.
- When `attack()` is executed, ETH is withdrawn from the PiggyBank to the attacker’s wallet.
- Demonstrates why access control is critical in public smart contracts.

## 🧪 Testing & Deployment
Used [Remix IDE](https://remix.ethereum.org) with:
- JavaScript VM & Injected Provider (MetaMask)
- Testnets for realistic simulation
- Manual transaction testing of deposit/withdraw/attack sequences

## 🧑🏽‍💻 Author
Najibat – Smart Contract Developer & Auditor  
Location: Lagos, Nigeria  
Date: July 2025
