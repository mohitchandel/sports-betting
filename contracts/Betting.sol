// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

contract Betting {

    address constant public admin = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    enum BettingSport {
        Football,
        Cricket,
        Boxing,
        MMA
    }
    
    enum BetStatus {
        Pending,
        Won,
        Lost
    }

    struct UserBet {
        BettingSport sports;
        uint8 team;
        uint256 amount;
        BetStatus status;
    }
    
    mapping(address => UserBet) public userBets;

    function placeBet(BettingSport _sport, uint8 _team, uint256 _amount) external {
        require(_amount > 0, "Amount should be greater than zero");
        require(_team > 0 && _team <= 2, "Invalid team selection");
        require(userBets[msg.sender].amount == 0, "You already have an existing bet");

        userBets[msg.sender] = UserBet({
            sports: _sport,
            team: _team,
            amount: _amount,
            status: BetStatus.Pending
        });
    }

    function checkResult() external view returns (BetStatus) {
        require(userBets[msg.sender].amount > 0, "No bet found for the user");
        return userBets[msg.sender].status;
    }

    function declareResult(address userAddress, BetStatus _result) external {
        require(msg.sender == admin, "Only admin can declare the result");
        require(userBets[userAddress].amount > 0, "No bet found for the specified user");

        userBets[userAddress].status = _result;
    }

}
