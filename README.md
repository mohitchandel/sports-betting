# Betting Smart Contract

This is a simple Ethereum smart contract for a betting platform. The contract allows users to place bets on various sports such as Football, Cricket, Boxing, and MMA. Admin can declare results after the matches are concluded.

## Features

1. **Place Bet**: Users can place bets by specifying the sport, team, and amount.
2. **Check Result**: Users can check the result of their bets, which can be either Pending, Won, or Lost.
3. **Declare Result**: Admin can declare the result for a specific user after the match is concluded.

## Smart Contract Functions

### PlaceBet

```solidity
function placeBet(BettingSport _sport, uint8 _team, uint256 _amount) external
```

Users can place a bet by providing the sport, team, and amount.

### checkResult

```solidity
function checkResult() external view returns (BetStatus)
```

Users can check the result of their bet, which returns the current status (Pending, Won, Lost).

### declareResult

```solidity
function declareResult(address userAddress, BetStatus \_result) external
```

Admin can declare the result for a specific user after the match is concluded.

### Usage

- Deploy the smart contract to an Ethereum blockchain.
- Interact with the smart contract using a web3-enabled application, Ethereum wallet, or command-line tools.

### Security Considerations

- Only the admin can declare the result.
- Users can place a bet only once.
- Additional security measures should be implemented based on specific use cases and requirements.
