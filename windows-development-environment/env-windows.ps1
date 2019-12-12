#-------------------------------------------------------------------------------#
#                                                                               #
# This script installs all the stuff I need to develop the things I develop.    #
# Run PowerShell with admin priveleges, type `env-windows`, and go make coffee. #
#                                                                               #
#                                                                        -Mario #
#                                                                               #
#-------------------------------------------------------------------------------#
# Set-ExecutionPolicy Unrestricted
# https://stackoverflow.com/questions/16460163/ps1-cannot-be-loaded-because-the-execution-of-scripts-is-disabled-on-this-syste

#
# Functions
#

function RefreshEnvPath
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

#
# Package Managers
#

# Choco
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | iex
RefreshEnvPath

#
# Git
#

choco install git --yes
choco install tortoisegit --yes
RefreshEnvPath

#
# AWS awscli
#
choco install awscli --yes
RefreshEnvPath

#
# MinGW
# 

choco install mingw --yes
RefreshEnvPath



#
# Languages
#
choco install python2 --yes
choco install jdk8 --yes
RefreshEnvPath


# File Management
choco install beyondcompare --yes
choco install filezilla --yes
choco install dropbox --yes

# Media Viewers
choco install irfanview --yes
choco install vlc --yes



# Misc
choco install sysinternals --yes
choco install procexp --yes
choco install intellijidea-community --yes
choco install conemu --yes
choco install mobaxterm  --yes
choco install bitvise-ssh-client --yes

choco install sublimetext3  --yes

choco install processhacker  --yes


RefreshEnvPath

Write-Output "Finished! Run `choco upgrade all` to get the latest software"



