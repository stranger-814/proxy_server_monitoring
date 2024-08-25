# Proxy Server Monitoring Script

This Bash script monitors various system resources on a proxy server and presents them in a dashboard format. It provides real-time insights by refreshing the data every few seconds and allows users to call specific parts of the dashboard individually using command-line switches.

## Features
- **Top 10 Most Used Applications**: Displays the top 10 applications consuming the most CPU and memory.
- **Network Monitoring**: Shows the number of concurrent connections, packet drops, and network traffic (MB in/out).
- **Disk Usage**: Displays disk space usage by mounted partitions and highlights partitions using more than 80% of the space.
- **System Load**: Shows the current load average for the system and provides a breakdown of CPU usage (user, system, idle, etc.).
- **Memory Usage**: Displays total, used, and free memory, including swap memory usage.
- **Process Monitoring**: Displays the number of active processes and shows the top 5 processes in terms of CPU and memory usage.
- **Service Monitoring**: Monitors the status of essential services such as sshd, nginx/apache, and iptables.
- **Custom Dashboard**: Allows viewing specific parts of the dashboard using command-line switches.

## Requirements
- **Linux environment**: If you're using Windows, it's recommended to use WSL (Windows Subsystem for Linux) or a similar environment that supports Linux commands.
- **Bash shell**: The script is written in Bash, so you need a Bash-compatible shell to run it.

## Installation

1. **Clone the repository**:
   ```bash
   git clone <https://github.com/stranger-814/proxy_server_monitoring.git>
   ```

2. **Navigate to the project directory**:
   ```bash
   cd proxy_server_monitoring
   ```

3. **Make the script executable**:
   ```bash
   chmod +x monitor.sh
   ```

## Usage

To run the script, simply execute the following command:

```bash
./monitor.sh
```

This will display the full dashboard with all system resources.

### Viewing Specific Parts of the Dashboard

You can view specific parts of the dashboard using the following command-line switches:

- **CPU Usage**:
  ```bash
  ./monitor.sh -cpu
  ```

- **Memory Usage**:
  ```bash
  ./monitor.sh -memory
  ```

- **Network Monitoring**:
  ```bash
  ./monitor.sh -network
  ```

- **Disk Usage**:
  ```bash
  ./monitor.sh -disk
  ```

- **Process Monitoring**:
  ```bash
  ./monitor.sh -process
  ```

- **Service Monitoring**:
  ```bash
  ./monitor.sh -services
  ```

### Example Commands

1. **View the full dashboard**:
   ```bash
   ./monitor.sh
   ```

2. **View CPU usage information only**:
   ```bash
   ./monitor.sh -cpu
   ```

3. **Check memory usage**:
   ```bash
   ./monitor.sh -memory
   ```

4. **Monitor active network connections and traffic**:
   ```bash
   ./monitor.sh -network
   ```

5. **Check disk usage of mounted partitions**:
   ```bash
   ./monitor.sh -disk
   ```

6. **Monitor active processes**:
   ```bash
   ./monitor.sh -process
   ```

7. **Check the status of essential services**:
   ```bash
   ./monitor.sh -services
   ```

## Customization

You can customize the script according to your specific needs by modifying the functions within the script. For example, you can add more services to monitor or adjust the refresh rate of the dashboard.

## Troubleshooting

If you encounter any issues while running the script, ensure that all required tools and commands (e.g., `ps`, `netstat`, `df`, `uptime`, `free`) are installed and available on your system. For Windows users, it is recommended to use WSL for better compatibility with Linux commands.

