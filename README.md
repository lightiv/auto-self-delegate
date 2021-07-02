![SkyNet | Validators](http://skynet.paullovette.com/wp-content/uploads/2021/03/SkyNet-Full-Logo-1500x500-Twitter-Cover.png)

# Auto-Self-Delegate

Here is a quick script to auto self-delegate your earned commission and rewards.  I learned this technic during the Akashian Challenges ITN phases.  NOTE: This will not work for Ledger deployed keys as you have to confirm every transaction on your Ledger.

## Step 1 - Add Your Key To The --keyring-backend

# STOP - CAUTION
## Note the following will allow anyone with access to your node and knowledge of the above to execute any command on you node!  Your node must be secure!!!

Login as root  

```  
desmos keys add <yourkeyname> --recover --keyring-backend test  
```  
## Step 2 - Create Your Self-Delegation Script

```  
mkdir ~/delegations && cd ~/delegations && nano selfdelegate.sh  
```
Paste the following into selfdelegate.sh  
```  
#!/bin/bash  
  
printf "\n";  
  
printf "$(date) Beginning Self Delegation" >> ~/delegations/selfdelegationlog.txt;  
printf "\n";  
desmos tx distribution withdraw-rewards <desmosvaloper1.....validator> -y --from skynet --fees 5000udaric --commission --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;  
  
printf "\n";  
printf "$(date) Waiting for 300 seconds" >> ~/delegations/selfdelegationlog.txt;  
sleep 300;  
printf "\n";  
  
delegate_value=$(desmos query bank balances <desmos1...your address> -o json | jq -r '.balances[].amount')"udaric" >> ~/delegations/selfdelegationlog.txt;  
  
desmos tx staking delegate desmosvaloper1vkq24s8zz2dswgq0zzas5s7s38ykmd63nqmmmf -y $delegate_value --from skynet --fees 5000udaric --chain-id morpheus-apollo-1 --keyring-backend test >> ~/delegations/selfdelegationlog.txt;  
  
printf "$(date) Delegated : $delegate_value\n" >> ~/delegations/selfdelegationlog.txt;  
printf "\n";  
  
printf "$(date) Self Delegation Completed" >> ~/delegations/selfdelegationlog.txt;  
printf "\n";  

```  
Save the file
```  
CTRL + o  
CTRL + x
```
Make it executable
```  
chmod +x selfdelegate.sh  
```  
## Step 3 - Automate The Script
We will use a cron job to automate the script

Configure cron job to run script  
```  
crontab -e   
```
Add the following two lines:
```
@hourly ~/delegations/selfdelegate.sh >> ~/delegations/selfdelegationlog.txt  
# */15 * * * *  ~/delegations/selfdelegate.sh >> ~/delegations/selfdelegationlog.txt  
```  
