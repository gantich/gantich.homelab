# Update and Upgrade Packages
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

# Install and Remove Packages
alias install='sudo apt-get install'
alias uninstall='sudo apt-get remove'
alias installf='sudo apt-get -f install' #force install
alias installfr='sudo apt-get -f install --reinstall' #force reinstall

# Add repository keys (usage: addkey XXXXXXXX - last 8 digits of the key)
alias addkey='sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com'
 
# Search apt repository
alias search='sudo apt-cache search'
 
# Cleaning
alias clean='sudo apt-get clean && sudo apt-get autoclean'
alias remove='sudo apt-get remove && sudo apt-get autoremove'
alias purge='sudo apt-get purge'
alias deborphan='sudo deborphan | xargs sudo apt-get -y remove --purge'
 
# Shutdown and Reboot
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'

# Commands
alias rrsync='rsync --verbose -rtvogp --progress' 
alias scp='scp -c blowfish'
alias nano='sudo nano -iSw$'
alias cp='cp --verbose'
alias mv='mv --verbose'