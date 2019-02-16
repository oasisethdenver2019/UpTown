/*
    This Token Contract implements the standard token functionality (https://github.com/ethereum/EIPs/issues/20)
    as well as the following OPTIONAL extras intended for use by humans.
.*/

import "./StandardToken.sol";
import "./SafeMath.sol";

pragma solidity ^0.4.8;

contract UpTownToken is StandardToken, SafeMath {

    /* Public variables of the token */

    event Conversion(address indexed _from, address indexed _to, uint256 _value);

    mapping (uint => address)   public participants;
    mapping (uint => bool)      public participantsExistance;
    uint256                     public participantsCount  = 0;

    address                     public founder;
    address                     public minter;

    string                      public name               =       "Base UpTown Token";
    uint8                       public decimals           =       6;
    string                      public symbol             =       "UPT";
    string                      public version            =       "0.1.0";
    uint                        public maxTotalSupply     =       100000 * 1000000;

    modifier onlyFounder() {
        if (msg.sender != founder) {
            throw;
        }
        _;
    }

    modifier onlyMinter() {
        if (msg.sender != minter) {
            throw;
        }
        _;
    }

    function issueTokens(address _for, uint tokenCount)
        external
        payable
        onlyMinter
        returns (bool)
    {
        if (tokenCount == 0) {
            return false;
        }

        if (add(totalSupply, tokenCount) > maxTotalSupply) {
            throw;
        }

        totalSupply = add(totalSupply, tokenCount);
        balances[_for] = add(balances[_for], tokenCount);
        Issuance(_for, tokenCount);
        return true;
    }

    function burnTokens(address _for, uint tokenCount)
        external
        onlyMinter
        returns (bool)
    {
        if (tokenCount == 0) {
            return false;
        }

        if (sub(totalSupply, tokenCount) > totalSupply) {
            throw;
        }

        if (sub(balances[_for], tokenCount) > balances[_for]) {
            throw;
        }

        totalSupply = sub(totalSupply, tokenCount);
        balances[_for] = sub(balances[_for], tokenCount);
        Burn(_for, tokenCount);
        return true;
    }

    function convertTo(address newToken, uint currentTokenPrice, uint newTokenPrice)
        external
        onlyFounder
        returns (bool)
    {
        UpTownToken newTokenContract = UpTownToken(newToken);


    }

    function changeMinter(address newAddress)
        public
        onlyFounder
        returns (bool)
    {   
        minter = newAddress;
    }

    function changeFounder(address newAddress)
        public
        onlyFounder
        returns (bool)
    {   
        founder = newAddress;
    }

    function () {
        throw;
    }

}
