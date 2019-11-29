file_name=atrace_`date +"%Y%m%d%H%M%S"`
src_dir=/data/oppo/log/DCS/de/oiface_trace
dest_dir=/data/oppo/log/DCS/en/oiface_trace
file_num=5

function log()
{
    echo "oiface_trace: $1" > /dev/kmsg
}

if [ ! -d $dest_dir ]
then
    mkdir $dest_dir
    chown system:system $dest_dir
    chmod 0660 $dest_dir
fi

if [ ! -d $src_dir ]
then
    mkdir $src_dir
else
    current_unix_time=`date +"%s"`
    seconde_per_day=`expr 60 \* 60 \* 24`
    files=`ls $src_dir`
    for file in $files
    do
        modify_unix_time=`stat -c %Y $src_dir/$file`
        if [ `expr $current_unix_time - $modify_unix_time` -gt $seconde_per_day ]
        then
            rm $src_dir/$file
        fi
    done
fi
chown system:system $src_dir
chmod 0660 $src_dir

for i in `seq 0 \`expr $file_num - 1\``
do
    touch $src_dir/${file_name}_$i
    chown system:system $src_dir/${file_name}_$i
    chmod 0660 $src_dir/${file_name}_$i
done

options="-c --stream_print=$src_dir/$file_name input i2c input_kernel"

pkg_name=`getprop debug.oiface.trace.pkg_name`
if  [ -n "$pkg_name" ]
then options="$options -a $pkg_name"
fi

atrace $options
