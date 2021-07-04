#!/bin/bash

printf "Beginning Self Delegation\n";

printf "$(date) Beginning Self Delegation" >> ~/delegations/selfdelegationlog.txt;
printf "\n";
desmos tx distribution withdraw-rewards <VALIDATOR_OPERATOR_ADDRESS> -y --from skynet --fees 5000udaric --commission --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;

printf "Waiting for 30 seconds\n";
printf "$(date) Waiting for 30 seconds" >> ~/delegations/selfdelegationlog.txt;
sleep 30;
printf "\n";

delegate_value=$(desmos query bank balances <SELF_DELEGATION_ADDRESS> -o json | jq -r '.balances[].amount')"udaric" >> ~/delegations/selfdelegationlog.txt;

desmos tx staking delegate <VALIDATOR_OPERATOR_ADDRESS> -y $delegate_value --from skynet --fees 5000udaric --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;

printf "$(date) Delegated : $delegate_value\n" >> ~/delegations/selfdelegationlog.txt;
printf "Delegated : $delegate_value\n";

printf "$(date) Self Delegation Completed" >> ~/delegations/selfdelegationlog.txt;
printf "Self Delegation Completed\n";
