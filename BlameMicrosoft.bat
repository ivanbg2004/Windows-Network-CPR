@echo off
:: ===============================================
:: Internet Optimization Script v3.0
:: Powered by Oblivion Development & Hosting
:: ===============================================

:: Display the current network configurations
echo [INFO] Attempting to show you network settings... But it's Windows, so good luck...
ipconfig /all
echo.

:: Continuous network latency test (replace with your gateway or reliable IP)
echo [INFO] Initiating network latency check... Hopefully it's not 1999 out here.
ping -t 192.168.12.1 > nul
echo.

:: Refreshing IP configurations
echo [INFO] Renewing IP address... Windows probably gave you `169.254`, so we're fixing it.
ipconfig /release
ipconfig /renew
echo.

:: Clearing DNS cache for faster resolution
echo [INFO] Flushing the DNS cache... Because Windows seems to think you still need AOL’s DNS.
ipconfig /flushdns
echo.

:: Updating TCP/IP stack for better efficiency
echo [INFO] Resetting TCP/IP stack... Windows calls this 'networking'. Let's make it work, shall we?
netsh int ip reset
netsh winsock reset
echo.

:: Disable TCP auto-tuning to reduce packet delays
echo [INFO] Disabling auto-tuning... Because Windows thinks it knows what's best, but it doesn’t.
netsh interface tcp set global autotuning=disable

:: Disable TCP Chimney Offload for stability
echo [INFO] Disabling TCP Chimney Offload... Whatever that means. It sounds like something Microsoft should've fixed by now.
netsh int tcp set global chimney=disabled

:: Disable Receive Side Scaling (RSS) for enhanced data transfer
echo [INFO] Disabling RSS... Windows thinks it’s helping, but it’s not.
netsh int tcp set global rss=disabled

:: Enable Direct Cache Access (DCA) for faster data transfer rates
echo [INFO] Enabling DCA... because Windows can't do anything fast, so we have to.
netsh int tcp set global dca=enabled

:: Disable TCP timestamps to reduce overhead
echo [INFO] Disabling TCP timestamps... Windows still using this relic from the '90s? Let’s make it stop.
netsh int tcp set global timestamps=disabled

:: Set maximum transmission unit (MTU) to 1500 for optimal performance
echo [INFO] Setting MTU size to 1500... Because Windows apparently doesn’t get the concept of ‘optimal’.
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
echo.

:: Resetting the ARP cache for cleaner routing
echo [INFO] Clearing ARP cache... Maybe now Windows will stop trying to route packets to your neighbor’s Wi-Fi.
arp -d *
echo.

:: Cleaning old routes for better routing paths
echo [INFO] Cleaning up old routes... Windows’ network paths are like a cluttered garage. Let’s clear that mess.
route /f
echo.

:: Configure DNS to use Google's Public DNS for faster lookups
echo [INFO] Setting Google Public DNS... Windows' default DNS servers were probably run by a hamster.
netsh interface ip set dns "Ethernet" static 8.8.8.8
netsh interface ip add dns "Ethernet" 8.8.4.4 index=2
echo.

:: Verifying applied settings
echo [INFO] Verifying changes... Let’s see if Windows is finally smart enough to keep them.
netsh int tcp show global
ipconfig /displaydns
echo.

:: Final instructions
echo ===============================================
echo [SUCCESS] Internet optimization completed successfully! But don’t get too excited — it’s Windows, after all.
echo [INFO] Script powered by Oblivion Development & Hosting. We fixed Windows’ mess for you.
echo ===============================================
pause
