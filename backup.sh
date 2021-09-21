# Location of backups
backup_data=""
# Location of the file to be saved
backup_folder=""
# Name of the file to be saved
backup_folder_name=""
# Safeguarding time (day)
backup_time=""
# Recovery of the date
date=`date "+%Y-%m-%d"`

# If the variables are passed at startup
backup_data=$1
backup_folder=$2
backup_folder_name=$3
backup_time=$4


function installation {
    clear
    echo "[INFO] Installation of dependencies..."
    apt update
    apt install zip -y
}

function backup {
    echo "[INFO] Creating a backup..."
    cd $backup_folder
    zip -r Backup-$date.zip $backup_folder/$backup_folder_name
    mv Backup-*.zip $backup_data
    cd $backup_data
    echo "[INFO] Removal of backups greater than : "$backup_time" days"
    find $backup_data -type f -mtime +7 -exec /bin/rm -rf {} \;
    echo "[INFO] Finish !"
}

if [ "$1" == "--install" ]
then
  installation
else
  backup
fi
exit 0