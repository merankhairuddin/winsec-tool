# Create a new local admin user
New-LocalUser -Name "winadm" -Password (ConvertTo-SecureString "Madman123!" -AsPlainText -Force) -AccountNeverExpires -PasswordNeverExpires -UserMayNotChangePassword -Description "EDR Test User"
Add-LocalGroupMember -Group "Administrators" -Member "winadm"

# Define domains and IP addresses for testing
$domains = @(
    "bash.givemexyz.in",
    "dc1.rightsnetwork.net",
    "coinlab.biz",
    "papoto.com",
    "cookiescript.info",
    "cookiescriptcdn.pro",
    "rocks.io",
    "ad-miner.com",
    "party-nngvitbizn.now.sh",
    "cryptoloot.pro",
    "host.d-ns.ga",
    "baiduccdn1.com",
    "jsccnn.com",
    "jscdndel.com",
    "mine.nahnoji.cz",
    "goredirect.party",
    "miner.pr0gramm.com",
    "miner.cryptobara.com",
    "digger.cryptobara.com"
)

$ips = @(
    "45.116.226.66",
    "103.240.252.30"
)

# Resolve domains and access IPs
foreach ($domain in $domains) {
    try {
        [System.Net.Dns]::GetHostAddresses($domain)
        Invoke-WebRequest -Uri "http://$domain" -UseBasicParsing -TimeoutSec 3
    } catch {
    }
}

foreach ($ip in $ips) {
    try {
        Invoke-WebRequest -Uri "http://$ip" -UseBasicParsing -TimeoutSec 3
    } catch {
    }
}
