					## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/nelliugj/Cybersecurity-projects-and-files/tree/main/images/Azure-DVWA-ELK.png)

![alt text](https://github.com/nelliugj/Cybersecurity-projects-and-files/tree/main/images/Azure-DVWA-ELK-Security-Rules.png)



These files have been tested and used to generate a live ELK deployment on Azure. 
They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ELK-beats-playbook file may be used to install only certain pieces of it, such as Filebeat. Or the separated playbooks for each of the beats can be found here too, filebeat-playbook.yml and metricbeat-playbook.yml.
Additionally the configuration files for filebeat-config.yml and metricbeat-config.yml are included as a reference 



ansible/ansible_config_files/
ansible.cfg
filebeat-config.yml
metricbeat-config.yml

ansible/playbooks/
elk.yml
ELK-beats-playbook.yml
filebeat-playbook.yml
metricbeat-playbook.yml


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers protect the Availability portion of the Security triad (CIA) 


What is the advantage of a jump box?
One of the main advantages of a jump box is to control access to a virtual network, because the jumpbox is setup to only accept connections from specific devices via SSH, that way the virtual environment can be securely managed remotely without compromising the data and information. For example, in our project we used a jump box to control access to our virtual network only from our workstation using SSH key authentication.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for analyzing and troubleshooting.

-Filebeat watches for file system information from the servers or locations defined in its configuration to later on forward 	them to Logstash and Elasticsearch. 

-Metricbeat records metrics and statistics from the Operating System and the services running on the server, such as Apache, 	MySQL, Nginx, PostgreSQL, MongoDB, etc.

The configuration details of each machine may be found below.

| Name                 | Function                   | Private IP Address | Public IP Address | Operating System     |
|----------------------|----------------------------|--------------------|-------------------|----------------------|
| Jump-Box-Provisioner | Gateway                    |      10.0.0.4      |   104.43.251.95   | Linux (ubuntu 18.04) |
| Web-1                | Load-balanced Web Server   |      10.0.0.5      |   52.173.21.166   | Linux (ubuntu 18.04) |
| Web-2                | Load-balanced Web Server   |      10.0.0.6      |   52.173.21.166   | Linux (ubuntu 18.04) |
| ELK-stack            | ELK stack server           |      10.1.0.4      |   13.78.184.111   | Linux (ubuntu 18.04) |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address:
24.21.45.165 via HTTP and port 5601

Machines within the network can only be accessed via the Ansible Container on 10.0.0.4 via SSH, 


A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Address    |
|----------------------|---------------------|-----------------------|
| Jump-Box-Provisioner | No                  | 24.21.45.165          |
| Web-1                | No                  | 24.21.45.165 10.0.0.4 | 
| Web-2                | No                  | 24.21.45.165 10.0.0.4 |
| ELK-stack            | No                  | 24.21.45.165 10.0.0.4 |

The machines have public IP address, but they are only accessible to any connections other than the workstation IP address, so they are not publicly accessible.



### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because the deployment is done in a fraction of the time that it would typically required if done manually, and the configuration could be replicated on to other machines with just a few clicks instead of manually setting up the system.

The main advantage of Ansible is that it is open-source, and allows a quick deployment based on yml playbooks (configuration files) that are easy to understand and modify if needed.

The elk.yml playbook implements the following tasks:

- Install Docker.
- Install Python3.
- Indicate that the Docker ELK container will be installed using with Python.
- Use sysctl to setup virtual memory to a max value of 262144 bytes, asrequired by Elasticsearch.
- Download and launch the Docker ELK container image named sebp/elk:761
- Enable start of the contatiner after boot


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/nelliugj/Cybersecurity-projects-and-files/tree/main/images/docker_ps.png


### Target Machines & Beats

This ELK server is configured to monitor the following machines:
webservers:
10.0.0.5
10.0.0.6

We have installed the following Beats on these machines:
Metricbeat - metricbeat-7.6.1-amd64.deb
Filebeat - filebeat-7.6.1-amd64.deb

These Beats allow us to collect the following information from each machine:

Filebeat allows us to collect system log data from the Web1 and Web2 servers and forwards them to Logstash for indexing.
We used it to track ssh logon events, but it can also be used to capture system.log, wifi.log, error.log, etc. 

Metricbeat allows us to collect metrics and statistics from the Operating System and the services running on the servers, such as Apache, MySQL, Nginx, PostgreSQL, MongoDB, etc. We used it to track CPU usage, Server Load, Memory usage on both of the web servers Web1 and Web2.



### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

- Copy the ELK-beats-playbook.yml file to /etc/ansible/roles.
you can download the ELK-beats-playbook using curl from this repository:
$ curl -L -O https://github.com/nelliugj/Cybersecurity-projects-and-files/ansible/playbooks/ELK-beats-playbook.yml
	

- Update the /etc/ansible/hosts file to include the server(s) where you want this beats to be installed on. For our project <webservers> and <elk> were the groups defined in ansible hosts file; and the playbook defines which hosts the beats will be installed on, in our project, beats are only installed on the <webservers> group defined in ansible. see the sample ansible hosts file for reference: ansible_hosts_file.txt

use the command: 'nano hosts', to view and modify the file, use Ctrl+x to save the changes.

- Run the playbook using the ansible-playbook command: 'ansible-playbook ELK-beats-playbook.yml'
  and navigate to  installation page on the ELK server GUI
	
To check filebeat was successfully installed:
	http://<KIBANA-SERVER>:5601/app/kibana#/home/tutorial/systemLogs 

To check metricbeat was successfully installed:
	http://<KIBANA-SERVER>:5601/app/kibana#/home/tutorial/dockerMetrics


   - 	On the same page, scroll to **Step 5: Module Status** and click **Check Data**.
   - 	Scroll to the bottom of the page and click **Verify Incoming Data** to check that the installation worked as expected.


you should see something like this for filebeat:
https://github.com/nelliugj/Cybersecurity-projects-and-files/tree/main/images/filebeatOK.jpg

you should see something like this for metricbeat:
https://github.com/nelliugj/Cybersecurity-projects-and-files/tree/main/images/metricbeatOK.jpg
	

