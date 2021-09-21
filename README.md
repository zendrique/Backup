# Presentation

I created a simple backup tool because I did not find it on the internet

# Configuration

Edit the backup.sh file and set the following variables :

```
backup_data=""
```
- This variable defines where or are storing backups
```
backup_folder=""
```
- This variable defines the location of the folder to save
```
backup_folder_name=""
```
- This variable defines the name of the folder or file that must be backuped
```
backup_time=""
```
- Cette variable définit le nombre de jours que doit conserver la sauvegarde

# Boot options

It is possible to pass the values ​​of the variables directly at the start of the program

The first variable corresponds to ```backup_data```

The second variable corresponds to ```backup_folder```

The third variable corresponds to ```backup_folder_name```

The fourth variable corresponds to ```backup_time```

## Example start line
```
bash /opt/Backup/backup.sh "/home/backup" "/var/www/" html 7
```

# Setup

To install the script perform the following commands
```
cd /opt
git clone https://github.com/zendrique/Backup
cd Backup
sudo bash backup.sh --install
```

Once done, open crontap (crontab -e) and enter the following line :
```
00 3 * * * bash /opt/Backup/backup.sh
```

## Warning

Please note that some file may require Sudo rights to be saved.
In this case define this line in the crontab of root !