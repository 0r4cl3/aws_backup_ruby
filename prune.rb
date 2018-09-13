require 'aws-sdk-ec2'

ec2 = Aws::EC2::Resource.new(region: 'eu-central-1')

ec2.snapshots.each do |snapshot|
  result = snapshot.tags.find do |tag|
    tag.key == "delete_backup_on"
  end
  puts result
end

