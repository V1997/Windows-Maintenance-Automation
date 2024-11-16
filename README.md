# Windows Maintenance Automation

This repository contains a PowerShell script to automate system maintenance tasks on Windows, such as clearing temporary files, browser cache, and prefetch files, running disk cleanup, and uninstalling unused programs. The script is designed to optimize your system's performance by running these tasks every hour.

## Features

- Disk Cleanup
- Clear Temporary Files
- Clear Browser Cache
- Clear Recycle Bin
- Clear Prefetch Files

## Prerequisites

- Windows PowerShell
- Administrative Privileges

## Installation

1. **Clone the repository:**

```sh
git clone https://github.com/yourusername/Windows-Maintenance-Automation.git
cd Windows-Maintenance-Automation
```

2. **Open PowerShell as Administrator:**

Right-click on the PowerShell icon and select "Run as Administrator".

3. **Run the Script:**

```sh
.\maintenance-script.ps1
```

## Scheduling the Script to Run Every Hour

You can use Windows Task Scheduler to run the script every hour.

### Steps:

1. **Open Task Scheduler:**

Press `Win + R`, type `taskschd.msc`, and press Enter.

2. **Create a New Task:**

   - In the "Action" pane, click "Create Task".
   - Give the task a name (e.g., "Windows Maintenance Automation").

3. **Set Triggers:**

   - Go to the "Triggers" tab.
   - Click "New" to create a new trigger.
   - Set the trigger to "Daily" and repeat the task every 1 hour.

4. **Set Actions:**

   - Go to the "Actions" tab.
   - Click "New" to create a new action.
   - Set the action to "Start a Program".
   - Browse and select `powershell.exe`.

5. **Add Arguments:**

   - Add the following arguments to run the script:
   
   ```sh
   -ExecutionPolicy Bypass -File "C:\Path\To\Your\Script\maintenance-script.ps1"
   ```

6. **Set Conditions (Optional):**

   - Go to the "Conditions" tab.
   - You can set conditions like starting the task only if the computer is idle.

7. **Finish:**

   - Click "OK" to save the task.
   - Your script will now run every hour.

## Logging

The script outputs logs to a specified log file located at:

```sh
C:\Users\yourName\Downloads\AnyFolderName\LogFile.txt
```

## Customization

You can customize the script to include or exclude specific maintenance tasks according to your needs.

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
