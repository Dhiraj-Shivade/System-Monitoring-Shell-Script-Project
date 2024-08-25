# System Monitoring Dashboard Script

## Introduction

The **System Monitoring Dashboard Script** is a Bash script designed to provide a comprehensive overview of your system's performance and status. 
It offers insights into CPU and memory usage, network activity, disk space, system load, memory usage, active processes, and the status of key services. 
This script is ideal for system administrators and users who wish to monitor their system's health efficiently.

## Script structure:

- **Top 10 Used Applications**: Displays the top 10 CPU and memory-consuming applications.
- **Network Monitoring**: Provides information on concurrent connections, packet drops, and data usage.
- **Disk Usage**: Shows disk space usage and highlights partitions using more than 80% space.
- **System Load**: Displays current system load and CPU usage breakdown.
- **Memory Usage**: Details memory and swap memory usage.
- **Process Monitoring**: Lists the number of active processes and the top 5 processes by CPU and memory usage.
- **Service Monitoring**: Checks the status of essential services (`sshd`, `nginx`, `apache2`, `iptables`).
- **Custom Dashboard**: Aggregates all the above information into a single view.
- **handle_options**: Parses command-line arguments and invokes the corresponding functions.

## Prerequisites

Ensure that the following command-line tools and utilities are available on your system if not install the respective ones first:
For example, on Debian-based systems like ubuntu which is referred for the entire script:

- bash
- ss
- netstat
- vnstat
- mpstat (a 'sysstat' package)
- df
- free
- swapon
- wc
- systemctl
- awk
- cut

## Usage
1. Clone the script to local to the preferred directory path.
   
2. Make the script executable: 
    chmod +x Monitoring.sh

3. Run the script:
   ./Monitroing.sh [options]

4. The script can be executed with various command-line options to display specific information or the entire dashboard.
   The available options are:

    -cpu : Display the top 10 CPU-consuming applications.
    -network : Display network monitoring information.
    -disk : Display disk usage information.
    -load : Display current system load and CPU usage breakdown.
    -memory : Display memory and swap usage.
    -process : Display process monitoring information.
    -service : Display the status of key services.
    -all : Display the complete dashboard with all information.

For example:

 1) To see top 10 cpu consuming apps:
    ./Monitoring.sh -cpu
    
 2) To see memory and swap usage:
     ./Monitoring.sh -memory
    
 3) To see complete dashboard:
     ./Monitoring.sh -all

 4) To see cpu, memory and disk at a time:
     ./Monitoring.sh -cpu -memory -disk




