#! /bin/sh

# include github.com/gabtec/shell-h
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/gabtec/shell-h/main/lib/helpers.sh)"

# --- Banner ---
print_banner "Geekathon 2023" 86

# Show Roadmap
# log info "Do you accept the following steps?"

# echo "  - Check python v3.11 or greater is installed, and install/update it?"
# echo "  - Check nodejs v18   or greater is installed, and install/update it?"

# log info "Proceed (y/N)?"

# read ANSWER

# if [ "$ANSWER" == "y" ]; then
#   log info "Starting setup..."
# else
#   log warn "Setup canceled."
#   exit 0
# fi

## NODE
NODE_V=$(node --version | cut -d "v" -f 2)
if [ $? -eq 0 ]; then 
  log ok "NodeJS found in version v$NODE_V "
fi

PYTHON_V=$(python3 --version | cut -d " " -f 2)
if [ $? -eq 0 ]; then 
  log ok "Python found in version v$PYTHON_V "
fi

# ---- install ----
log info "Installing dependencies..."
npm install

log info "Creating local .env file..."
cp .env.local.example .env.local

log warn "Please edit \".env.local\" file with your own data values."
code .env.local

exit 0