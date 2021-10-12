#!/usr/bin/env bash

# Make sure to set current directory to repository root.
cd `dirname "$0"`

# Get environment variables to identify distributions
# by reading '/etc/os-release' file.
source /etc/os-release

# Run OS-specific installation script.
if [ "$ID" == "arch" ]; then
  echo "INFO: Installing configuration for Arch Linux"
  arch/run.fish
elif [ "$ID" == "ubuntu" ]; then
  echo "Ubuntu Distribution"
  #source ubuntu/run.sh
else
  echo "Operating system or Linux distribution is not supported."
fi
