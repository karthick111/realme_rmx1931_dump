#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:83886080:a999cad2e2dbb57e31b83bd900279c3f98235626; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:100663296:1eb5b63508a052b6c70308cafd488c50065d50b2 EMMC:/dev/block/bootdevice/by-name/recovery a999cad2e2dbb57e31b83bd900279c3f98235626 83886080 1eb5b63508a052b6c70308cafd488c50065d50b2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
