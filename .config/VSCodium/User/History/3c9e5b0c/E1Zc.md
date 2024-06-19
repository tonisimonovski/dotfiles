UFW Essentials: Common Firewall Rules and Commands

# Introduction

UFW (uncomplicated firewall) is a firewall configuration tool that runs on top of iptables, included by default within Ubuntu distributions. It provides a streamlined interface for configuring common firewall use cases via the command line.

This cheat sheet-style guide provides a quick reference to common UFW use cases and commands, including examples of how to allow and block services by port, network interface, and source IP address.

Remember that you can check your current UFW ruleset with sudo ufw status or sudo ufw status verbose.

# Verify UFW Status

To check if ufw is enabled, run:

    sudo ufw status

Output if its active
Status: active

To                         Action      From
--                         ------      ----
80/tcp                     ALLOW       Anywhere               
443                        ALLOW       Anywhere               
80/tcp (v6)                ALLOW       Anywhere (v6)          
443 (v6)                   ALLOW       Anywhere (v6)


# Enable UFW

If you got a Status: inactive message when running ufw status, it means the firewall is not yet enabled on the system. You’ll need to run a command to enable it.

Hint: 
By default, when enabled UFW will block external access to all ports on a server. In practice, that means if you are connected to a server via SSH and enable ufw before allowing access via the SSH port, you’ll be disconnected. Make sure you follow the section on how to enable SSH access of this guide before enabling the firewall if that’s your case.

To enable UFW on your system, run:

    sudo ufw enable

You’ll see output like this:

Output
Firewall is active and enabled on system startup

# Disable UFW

If for some reason you need to disable UFW, you can do so with the following command:

    sudo ufw disable

Be aware that this command will fully disable the firewall service on your system.

# Block an IP Address

To block all network connections that originate from a specific IP address, run the following command, replacing the highlighted IP address with the IP address that you want to block:

    sudo ufw deny from 203.0.113.100

Output
Rule added

In this example, from 203.0.113.100 specifies a source IP address of “203.0.113.100”.
If you run sudo ufw status now, you’ll see the specified IP address listed as denied:

Output
Status: active

To                         Action      From
--                         ------      ----
Anywhere                   DENY        203.0.113.100         



All connections, coming in or going out, are blocked for the specified IP address.

# Block a Subnet

If you need to block a full subnet, you may use the subnet address as from parameter on the ufw deny command. This would block all IP addresses in the example subnet 203.0.113.0/24:

    sudo ufw deny from 203.0.113.0/24

Output
Rule added

# Block Incoming Connections to a Network Interface

To block incoming connections from a specific IP address to a specific network interface, run the following command, replacing the highlighted IP address with the IP address you want to block:

    sudo ufw deny in on eth0 from 203.0.113.100

Output
Rule added

The in parameter tells ufw to apply the rule only for incoming connections, and the on eth0 parameter specifies that the rule applies only for the eth0 interface. This might be useful if you have a system with several network interfaces (including virtual ones) and you need to block external access to some of these interfaces, but not all.

# Allow an IP Address

To allow all network connections that originate from a specific IP address, run the following command, replacing the highlighted IP address with the IP address that you want to allow access:

    sudo ufw allow from 203.0.113.101
Output
Rule added

If you run sudo ufw status now, you’ll see output similar to this, showing the word ALLOW next to the IP address you just added.

Output
Status: active

To                         Action      From
--                         ------      ----
...          
Anywhere                   ALLOW       203.0.113.101 

You can also allow connections from a whole subnet by providing the corresponding subnet mask for a host, such as 203.0.113.0/24.

# Allow Incoming Connections to a Network Interface

To allow incoming connections from a specific IP address to a specific network interface, run the following command, replacing the highlighted IP address with the IP address you want to allow:

    sudo ufw allow in on eth0 from 203.0.113.102

Output
Rule added

The in parameter tells ufw to apply the rule only for incoming connections, and the on eth0 parameter specifies that the rule applies only for the eth0 interface.

If you run sudo ufw status now, you’ll see output similar to this:

Output
Status: active

To                         Action      From
--                         ------      ----
...         
Anywhere on eth0           ALLOW       203.0.113.102            

# Delete UFW Rule

To delete a rule that you previously set up within UFW, use ufw delete followed by the rule (allow or deny) and the target specification. The following example would delete a rule previously set to allow all connections from an IP address of 203.0.113.101:

    sudo ufw delete allow from 203.0.113.101

Output
Rule deleted

Another way to specify which rule you want to delete is by providing the rule ID. This information can be obtained with the following command:

    sudo ufw status numbered

Output
Status: active

To                         Action      From
--                         ------      ----
[ 1] Anywhere                   DENY IN     203.0.113.100             
[ 2] Anywhere on eth0           ALLOW IN    203.0.113.102             

From the output, you can see that there are two active rules. The first rule, with highlighted values, denies all connections coming from the IP address 203.0.113.100. The second rule allows connections on the eth0 interface coming in from the IP address 203.0.113.102.

Because by default UFW already blocks all external access unless explicitly allowed, the first rule is redundant, so you can remove it. To delete a rule by its ID, run:

    sudo ufw delete 1

You will be prompted to confirm the operation and to make sure the ID you’re providing refers to the correct rule you want to delete.

Output
Deleting:
 deny from 203.0.113.100
Proceed with operation (y|n)? y
Rule deleted

If you list your rules again with sudo ufw status, you’ll see that the rule was removed.

# List Available Application Profiles

Upon installation, applications that rely on network communications will typically set up a UFW profile that you can use to allow connection from external addresses. This is often the same as running ufw allow from, with the advantage of providing a shortcut that abstracts the specific port numbers a service uses and provides a user-friendly nomenclature to referenced services.

To list which profiles are currently available, run the following:

    sudo ufw app list

If you installed a service such as a web server or other network-dependent software and a profile was not made available within UFW, first make sure the service is enabled. For remote servers, you’ll typically have OpenSSH readily available:

Output
Available applications:
  OpenSSH

# Enable Application Profile

To enable a UFW application profile, run ufw allow followed by the name of the application profile you want to enable, which you can obtain with a sudo ufw app list command. In the following example, we’re enabling the OpenSSH profile, which will allow all incoming SSH connections on the default SSH port.

    sudo ufw allow “OpenSSH”

Output
Rule added
Rule added (v6)

Remember to quote profile names that consist of multiple words, such as Nginx HTTPS.




