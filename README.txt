# cyberpatriot2022
cyberpatriot 

Ubuntu CyberPatriot Checklist WIP

Basic instructions:
ALWAYS do the forensic questions first!!! IMPORTANT!!!!!
Helpful forensic site: https://cyberchef.org/
Make snapshots consistently pls
Do not stop scoring unless the machine is not working properly at all!!
Note: Do not use ctrl+c/v in terminal, use ctrl+shift+c/v instead:
P@$$W0rd1! is the password we will use when changing user accounts

UPGRADE/UPDATE SYSTEM FIRST
sudo apt update && sudo apt upgrade -y #ONE LINER
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
UPDATE AND CONFIGURE FIREFOX SETTINGS
firefox --version (To show which version you are running)
sudo apt install firefox
Open Firefox and go to Privacy and Security
Standard protection, Turn off "Ask to save logins and passwords"
Make sure Dangerous and deceptive content is blocked, addons blocked, popups blocked, and delete cookies

CHECK USERS AND DISABLE ANY UNAPPROVED USER ACCOUNTS. REMOVE THEM FROM GROUPS ALSO
cd /etc
sudo nano passwd
comment out any unauthorized accounts by using a "#" Then save by pressing ctrl+x
make sure to remove users from unauthorized groups (sudo, adm) while you are in /etc
sudo nano group
DISABLE GUEST ACCOUNT

TURN ON FIREWALL
sudo ufw enable (enables firewall)
sudo ufw status (shows status of firewall)
sudo apt-get install gufw (to install graphical interface)
gufw (to run)
Profile on Home, Reject Incoming, and Allow Outgoing

CHECK FOR MALWARE
sudo apt install clamav -y (installs clamav)
clamscan (to scan system for malware)

USE SUDO INSTEAD OF ROOT!!
sudo passwd -l root (disables root account)
MAKE SURE cracklib IS INSTALLED


CHANGE PASSWORD POLICY (MAKE SURE TO SNAPSHOT BEFORE, note: this section isnt reallyy working)
sudo apt-get remove libpam-pwquality (Might have to do to get libpam crack to work right)???
sudo apt-get install libpam-cracklib
sudo nano common-password
After the end of pam_unix.so line add "remember=5"
After pam_cracklib.so add "ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1"
save settings and exit the editor
sudo nano ../login.defs (to open the login settings in nano editor)
"PASS_MAX_DAYS 45
PASS_MIN_DAYS 1
PASS_WARN_AGE 7"
Go to "/etc/pam.d"
sudo nano common-auth 
Add this line at the end auth "deny=5 onerr=fail unlock_time=1800"
save and exit nano

REMOVE UNAUTHORIZED FILES, PROGRAMS, AND HACKING TOOLS (media files, games, hacking tools, malware)
ls -la (shows hidden files)
Use filefinder.sh bash script to easily find files^^^
go to / (cd ../..)
sudo apt install plocate (plocate is a tool that assists with locating file types and extentions)
plocate *.mp3 (or *.jpg, .*mp4, *.png, *.mov, *.gif, *.txt, etc)
locate *mp3
Common hacking tools: Recon-ng, Nmap, NetBIOS, Nessus. L0phtCrack, njRAT, Wireshark, SET, HOIC, ZAP, sqlmap, Aicrack-ng, Burp SUite, John the Ripper, Metasploit, Ettercap

INSTALL LYNIS TO SCAN FOR VUNERABILITIES
sudo apt install lynis
sudo lynis audit system

DISABLE ROOT SSH LOGIN
sudo nano /etc/ssh/sshd_config
make sure the settings for "PermitRootlogin no"
"systemctl restart sshd" to restart ssh service
DISABLE FTP IF NECCISARY
sudo service vsftpd stop (to stop the servce)
sudo apt-get remove vsftpd (to remove it)
