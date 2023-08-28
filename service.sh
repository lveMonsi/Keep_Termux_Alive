#!/system/bin/sh
MODDIR=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 1
    done
    
echo "PowerManagerService.noSuspend" > /sys/power/wake_lock

while true; do
    if dumpsys window windows | grep -q "Window #.*Window{.*com.termux/com.termux.app.TermuxActivity}":; then
            # com.termux/com.termux.app.TermuxActivity正在前台运行
            sleep 60s
        else
            # com.termux/com.termux.app.TermuxActivity不在前台运行
            am start -n com.termux/com.termux.app.TermuxActivity
    fi
done