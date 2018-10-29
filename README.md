# aws_backup_ruby

The two scripts help creating and removing Snapshots from you EC2 account

Backup Script:

The backup script goes through each of the volumes in the specified AZ and will create a Snapshot. If the volume has a Tag:Name, this will be added to the Snapshot. 
It will also add a Tag:delete_backup_on using the retention time specified at the beginning with the future deletion day


Prune Job
the prune job will just go trhough the list of Snapshot and if it will find a Tag:delete_backup_on with the current date, it will delete the backup.



