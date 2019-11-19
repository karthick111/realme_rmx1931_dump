#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:83886080:a6507ed9560fc711cdc47cfd7594ec4135601bab; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:100663296:35e7a3708e62146cd96380911bf69243821fc5b9 EMMC:/dev/block/bootdevice/by-name/recovery a6507ed9560fc711cdc47cfd7594ec4135601bab 83886080 35e7a3708e62146cd96380911bf69243821fc5b9:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
