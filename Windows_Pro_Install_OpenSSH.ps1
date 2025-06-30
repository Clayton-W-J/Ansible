#Check if OpenSSH is available:
#Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

#Install OpenSSH Server:
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

#Set the service to start automatically on boot:
Set-Service -Name sshd -StartupType Automatic

#Start the SSH service:
Start-Service sshd

#The installation process should automatically create a firewall rule to allow incoming SSH connections on port 22. You can verify this by checking the Windows Firewall with Advanced Security settings, specifically the Inbound Rules. If the rule isn't present or is disabled, you can create it manually using:
#New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH SSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

#You can verify the installation by checking the status of the sshd service:
#Get-Service sshd
