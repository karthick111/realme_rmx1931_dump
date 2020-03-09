#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:83886080:94a0017081077bc5096674a72318ef9ef9ce88a7; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:100663296:7955fdc2e84146b84fad2047800bfb892e1b752f EMMC:/dev/block/bootdevice/by-name/recovery 94a0017081077bc5096674a72318ef9ef9ce88a7 83886080 7955fdc2e84146b84fad2047800bfb892e1b752f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
