#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:83886080:5759f9da5748e54f7052495e996bf7b68808ef39; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:100663296:7433f6f26f594d5197aeca9492fe4d4c91cb045d EMMC:/dev/block/bootdevice/by-name/recovery 5759f9da5748e54f7052495e996bf7b68808ef39 83886080 7433f6f26f594d5197aeca9492fe4d4c91cb045d:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
