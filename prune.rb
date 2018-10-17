require 'aws-sdk-ec2'

ec2 = Aws::EC2::Resource.new(region: 'eu-central-1')

result = ec2.snapshots.select do |snapshot|

  result = snapshot.tags.find do |tag|
    tag.key == "delete_backup_on"
  end
  !!result
end

to_delete = result.select do |object|
  snapshot = object.tags.find do |snapshot|
    snapshot.key == "delete_backup_on"
  end
  if Time.parse(snapshot.value) <= Time.now.utc
    !!snapshot
  end
end

to_delete.each do |snap|
  snap.delete
end
