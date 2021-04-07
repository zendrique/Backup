# Location of backups
backup_data="/home/backup"
# Location of the file to be saved
backup_folder="/home"
# Name of the file to be saved
backup_folder_name="test"
# Safeguarding time (day)
backup_time="7"
# Recovery of the date
date=`date "+%Y-%m-%d"`

function installation {
    clear
    echo "[INFO] Installation of dependencies..."
    apt update
    apt install find zip -y
    mkdir /opt/backup
    mv /home/Backup/backup.sh /opt/backup 
}

function backup {
    echo "[INFO] Creating a backup..."
    cd $backup_folder
    zip -r Backup-$date.zip $backup_folder/$backup_folder_name
    mv Backup-*.zip /$backup_folder $backup_data
    cd $backup_data
    echo "[INFO] Removal of backups greater than :" $backup_time
    find $backup_data -type f -mtime +7 -exec /bin/rm -rf {} \;
    echo "[INFO] Finish !"
}

if [ "$1" -eq "--install" ]
    then
    installation
else
    backup
fi
exit 0