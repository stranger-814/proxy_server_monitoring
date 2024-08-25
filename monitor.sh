#!/bin/bash

# Detect Operating System
OS=$(uname)

# Function to monitor top 10 most used applications
top_apps() {
    if [[ "$OS" == "Linux" ]]; then
        ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11
    else
        tasklist /v | head -n 11
    fi
}

# Function to monitor network
network_monitor() {
    if [[ "$OS" == "Linux" ]]; then
        netstat -an | grep ESTABLISHED | wc -l
        netstat -i | awk '{print $1, $4, $5}'
        ifconfig | grep 'RX bytes'
    else
        netstat -an | find "ESTABLISHED" | wc -l
        ipconfig
    fi
}

# Function to monitor disk usage
disk_usage() {
    if [[ "$OS" == "Linux" ]]; then
        df -h | awk '$5 > 80 {print}'
    else
        # Use `wmic` for disk usage on Windows
        wmic logicaldisk get size,freespace,caption
    fi
}

# Function to monitor system load
system_load() {
    if [[ "$OS" == "Linux" ]]; then
        uptime
        mpstat
    else
        wmic cpu get loadpercentage
    fi
}

# Function to monitor memory usage
memory_usage() {
    if [[ "$OS" == "Linux" ]]; then
        free -h
        swapon --summary
    else
        systeminfo | findstr /C:"Total Physical Memory" /C:"Available Physical Memory"
    fi
}

# Function to monitor processes
process_monitor() {
    if [[ "$OS" == "Linux" ]]; then
        ps aux | wc -l
        ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
    else
        tasklist /v | head -n 6
    fi
}

# Function to monitor services
service_monitor() {
    if [[ "$OS" == "Linux" ]]; then
        systemctl is-active sshd nginx iptables
    else
        sc query
    fi
}

# Custom dashboard
case "$1" in
    -cpu)
        system_load
        ;;
    -memory)
        memory_usage
        ;;
    -network)
        network_monitor
        ;;
    -disk)
        disk_usage
        ;;
    -process)
        process_monitor
        ;;
    -services)
        service_monitor
        ;;
    *)
        top_apps
        network_monitor
        disk_usage
        system_load
        memory_usage
        process_monitor
        service_monitor
        ;;
esac
