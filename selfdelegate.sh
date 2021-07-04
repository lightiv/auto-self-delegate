#!/bin/bash

printf "\n\n" >> ~/delegations/selfdelegationlog.txt;
printf "Beginning Self Delegation\n";
printf "$(date) Beginning Self Delegation" >> ~/delegations/selfdelegationlog.txt;
desmos tx distribution withdraw-rewards <VALIDATOR_OPERATOR_ADDRESS> -y --from skynet --fees 5000udaric --commission --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;

printf "Waiting for 12 to ensure tx processed\n";
printf "$(date) Waiting for 12 to ensure tx processed" >> ~/delegations/selfdelegationlog.txt;
sleep 12;
printf "\n" >> ~/delegations/selfdelegationlog.txt;

printf "Retrieving Available Tokens To Delegation\n";
printf "$(date) Retrieving Available Tokens To Delegation\n" >> ~/delegations/selfdelegationlog.txt;
delegate_value=$(desmos query bank balances <SELF_DELEGATION_ADDRESS> -o json | jq -r '.balances[].amount')"udaric" >> ~/delegations/selfdelegationlog.txt;

printf "Delegating Available Tokens\n";
printf "$(date) Delegating Available Tokens\n" >> ~/delegations/selfdelegationlog.txt;
desmos tx staking delegate <VALIDATOR_OPERATOR_ADDRESS> -y $delegate_value --from skynet --fees 5000udaric --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;

printf "$(date) Delegated : $delegate_value\n" >> ~/delegations/selfdelegationlog.txt;
printf "Delegated : $delegate_value\n";

printf "$(date) Self Delegation Completed\n" >> ~/delegations/selfdelegationlog.txt;
printf "Self Delegation Completed\n";
