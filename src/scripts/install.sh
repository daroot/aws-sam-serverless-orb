cd /tmp || true
if [[ $EUID == 0 ]]; then export SUDO=""; else # Check if we are root
  export SUDO="sudo";
fi
curl -L https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip -o aws-sam-cli-linux-x86_64.zip
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
$SUDO ./sam-installation/install
which sam
echo "export PATH=$PATH:/usr/local/bin/sam" >> "$BASH_ENV"
sam --version