# cyberpatriot2022
cyberpatriot 

Ubuntu CyberPatriot Checklist WIP

Basic instructions:
ALWAYS do the forensic questions first!!! IMPORTANT!!!!!
Helpful forensic site: https://cyberchef.org/
Make snapshots consistently pls
Do not stop scoring unless the machine is not working properly at all!!
Note: Do not use ctrl+c/v in terminal, use ctrl+shift+c/v instead:
 is the password we will use when changing user accounts

UPGRADE/UPDATE SYSTEM FIRST
sudo apt update && sudo apt upgrade -y #ONE LINER
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
turn on automatically checks for updates in the Software & Updates application. 

UPDATE AND CONFIGURE FIREFOX SETTINGS
firefox --version (To show which version you are running)
sudo apt install firefox
Open Firefox and go to Privacy and Security
Standard protection, Turn off "Ask to save logins and passwords"
Make sure Dangerous and deceptive content is blocked, addons blocked, popups blocked, and delete cookies
Firefox does not autofill credit card info 
CHECK USERS AND DISABLE ANY UNAPPROVED USER ACCOUNTS. REMOVE THEM FROM GROUPS ALSO
cd /etc
sudo nano passwd
comment out any unauthorized accounts by using a "#" Then save by pressing ctrl+x
make sure to remove users from unauthorized groups (sudo, adm) while you are in /etc
sudo nano group

MAKE SURE NO NON-ROOT ACCOUNTS HAVE UID SET TO 0
awk -F: '($3 == "0") {print}' /etc/passwd (to display al;l counts with UID set to 0)
root:x:0:0:root:/root:/bin/bash (how the output supposed to look like) 
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
FIX INSECURE SUDO CONFIGS VIA SUDOERS FILE

MAKE SURE cracklib IS INSTALLED
CHANGE PASSWORD POLICY (MAKE SURE TO SNAPSHOT BEFORE, note: this section isnt reallyy working)
sudo apt-get remove libpam-pwquality (Might have to do to get libpam crack to work right)???
sudo apt-get install libpam-cracklib
sudo nano common-password
After the end of pam_unix.so line add "remember=5"
After pam_cracklib.so add "ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1"
save settings and exit the editor
sudo nano ../login.defs (to open the login settings in nano editor)
"PASS_MAX_DAYS 90
PASS_MIN_DAYS 10
PASS_WARN_AGE 7"
Go to "/etc/pam.d"
sudo nano common-auth 
Add this line at the end "auth required pam_tally2.so deny=5 onerr=fail unlock_time=1800"
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

INSTALL CHKROOTKIT (checks for rootkits that could be the system)
sudo apt install chkrootkit -y (to install)
sudo chkrootkit (to run)
sudo chkrootkit > results (see results)

REMOVE ANY UNUSED AND SUS PORTS
sudo ss -atpu (to list opened and listening ports)
sudo apt remove "nameOfService" (removes sus services from port listening) 

DISABLE ROOT SSH LOGIN
sudo nano /etc/ssh/sshd_config
make sure the settings for "PermitRootlogin no"
"systemctl restart sshd" to restart ssh service

DISABLE FTP IF NECCISARY
sudo systemctl stop pure-ftpd (to stop the servce)
sudo systemctl disable pure-ftpd (to disable it)

CHECK LOG FILES 
Below are the common default log locations

/var/log/message (Where whole system logs or current activity logs are available)
/var/log/auth.log (Authentication logs)
/var/log/kern.log (Kernel logs)
/var/log/cron.log (cron logs)
/var/log/maillog (mail server logs)
/var/log/boot.log (System boot log)
/var/log/mysqld.log (MySQL database server log file)
/var/log/secure (Authentication log)
/var/log/utmp or /var/log/wtmp (Login records file)
/var/log/apt (Apt package manager logs)
