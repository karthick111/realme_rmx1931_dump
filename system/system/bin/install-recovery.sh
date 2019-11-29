#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:83886080:851be07d34707a2f3a19f2699d0b58e3d31077a4; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:100663296:0ae1ec9bab30dc05f88286e3111746a723c60750 EMMC:/dev/block/bootdevice/by-name/recovery 851be07d34707a2f3a19f2699d0b58e3d31077a4 83886080 0ae1ec9bab30dc05f88286e3111746a723c60750:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
