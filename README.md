# 6plat-ddns-script
an simple 6in4 ddns script for Linux and OpenWRT/LEDE

## Usage:

### Cpoy to your machine:

If you use curl, then

curl -kO "https://raw.githubusercontent.com/jqqqqqqqqqq/6plat-ddns-script/master/6plat_ddns.sh"

If you use wget, then

wget -O --no- check-certificate "https://raw.githubusercontent.com/jqqqqqqqqqq/6plat-ddns-script/master/6plat_ddns.sh"

### Use with Cron:

Add this line to your cron

\*/5 \* \* \* \* "absolute path to your script"

change the "absolute path to your script" to your custom settings.
