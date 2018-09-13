require 'aws-sdk-ec2'

ec2 = Aws::EC2::Resource.new(region: 'eu-central-1')

#Add the number of days you want to keep the backup
retention_days = 2

delete_on = Time.now.utc + (60 * 60 * 24 * retetion_days)

ec2.volumes.each do |volume|
  result = volume.tags.find do |tag|
    tag == "Name"
  end
  tag_name = result.value

  snapshot = ec2.create_snapshot ({
    description: "Snapshot created automatically using the aws_backup script https://github.com/0r4cl3/aws_backup_ruby",
    volume_id: volume.id,
    tag_specifications: [{resource_type: 'snapshot', tags: [{key: "Name", value: tag_name}, {key: "delete_backup_on", value: delete_on}]}]
  })
end
