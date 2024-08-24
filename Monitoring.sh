#!/bin/bash

# Display the top 10 used apps based on CPU and Memory
top_apps() {
  echo "Top 10 Used Applications:"

  echo "CPU Usage:"
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 11

  echo "Memory Usage:"
  ps -eo pid,comm,%mem --sort=-%mem | head -n 11
}

# Display network monitoring info
network_monitoring() {
  echo "Network Monitoring:"

  echo "Concurrent Connections:"
  ss -s | grep 'TCP:' | awk '{print $4}'

  echo "Packet Drops:"
  netstat -i | awk '/^eth0/ {print "In: " $4 " Out: " $8}'
  
  echo "Number of MB in and out:"
  vnstat --oneline | awk -F'|' '{print "In: " $5 " MB, Out: " $6 " MB"}'
}

# Display disk usage
disk_usage() {
  echo "Disk Space Usage:"
  df -h | awk '{print $1 " " $5 " " $6}' | while read line; do
    echo "$line"
  done
  
  echo "Partitions using more than 80% space:"
  df -h | awk '$5 > 80 {print $1 " " $5 " " $6}'
}

# Display system load
system_load() {
  echo "Current System Load:"
  uptime
  
  echo "CPU Usage Breakdown:"
  mpstat
}

# Display memory usage
memory_usage() {
  echo "Memory Usage:"
  free -h
  
  echo "Swap Memory Usage:"
  swapon --show
}

# Display process monitoring
process_monitoring() {
  echo "Process Monitoring:"

  echo "Number of Active Processes:"
  ps aux | wc -l
  
  echo "Top 5 Processes by CPU Usage:"
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

  echo "Top 5 Processes by Memory Usage:"
  ps -eo pid,comm,%mem --sort=-%mem | head -n 6
}

# Display service monitoring
service_monitoring() {
  echo "Service Monitoring:"
  for service in sshd nginx apache2 iptables; do
    systemctl is-active --quiet $service && echo "$service is running" || echo "$service is not running"
  done
}

# Display the custom dashboard
dashboard() {
  top_apps
  network_monitoring
  disk_usage
  system_load
  memory_usage
  process_monitoring
  service_monitoring
}

# Handle command-line switches using options
handle_options() {
  for option in "$@"; do
    case $option in
      -cpu) top_apps ;;
      -network) network_monitoring ;;
      -disk) disk_usage ;;
      -load) system_load ;;
      -memory) memory_usage ;;
      -process) process_monitoring ;;
      -service) service_monitoring ;;
      -all) dashboard ;;
    esac
  done
}

# Main script execution
handle_options "$@"

# End