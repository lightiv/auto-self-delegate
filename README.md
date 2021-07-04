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
## Step 2 - Download The Self-Delegation Script

```  
mkdir ~/delegations && cd ~/delegations
```
Download the selfdelegate.sh  



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
