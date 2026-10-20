# Add-Path

A simple PowerShell script for adding directories to the Windows PATH environment variable.

# Usage

``` .\Add-Path.ps1 [-Path <string>] [-Scope <User|Machine>] [-WhatIf] ```

# Parameters

| Parameter | Description                                   | Default               |
|-----------|-----------------------------------------------|-----------------------|
| -Path     | Directory to add to PATH.                     | . (current directory) |
| -Scope    | Environment variable scope (User or Machine). | User                  |
| -WhatIf   |Preview changes without applying them.         | Disabled              |

# Requirements

* Windows 10 or Windows 11
* PowerShell 5.1 or later
* Administrator privileges for modifying Machine PATH
