# vMix-Trial-Extender

## Overview

vMix-Trial-Extender is an **educational demonstration** script that shows how a forensic analyst might attempt to reset the trial state of the vMix software. The script (`vMixV2.bat`) is designed for learning and research purposes only.

> **WARNING:**
>
> - This script is **destructive**. It deletes files and registry keys related to vMix trial state.
> - **Do NOT run this on a real system.** Use only in a virtual machine snapshot or disposable environment.
> - Running this script on a production or personal system may result in data loss or software malfunction.

## Purpose

The script demonstrates, based on hypothetical forensic analysis, how one might attempt to remove traces of a software trial. It is not intended for bypassing software licensing, but to illustrate the types of artifacts that trial software may use.

## What the Script Does

1. **Terminates the vMix Process:**

   - Attempts to stop `vmix.exe` if it is running, to unlock files for deletion.

2. **Deletes a Hypothetical Lock File:**

   - Looks for a file at `%ProgramData%\vMix\license.lock` and deletes it if found.

3. **Deletes a Hypothetical Registry Key:**

   - Searches for the registry key `HKEY_CURRENT_USER\SOFTWARE\StudioCoast\vMix\State` and deletes it if present.

4. **Displays Status Messages:**

   - Informs the user of each action's result (success, failure, or not found).

5. **Final Message:**
   - Reminds the user that if the trial is still expired, the software may use more advanced protections (e.g., hardware fingerprinting).

## Usage

1. **Preparation:**

   - Only use in a virtual machine or disposable test environment.
   - Ensure you have a snapshot or backup before running.

2. **Run the Script:**

   - Double-click `vMixV2.bat` or run it from a command prompt with administrator privileges.

3. **Observe Output:**
   - Follow the on-screen prompts and review the status of each operation.

## Disclaimer

This script is for **educational and research purposes only**. The author is not responsible for any damage or misuse. Do not use this script to bypass software licensing or for any illegal activity.
