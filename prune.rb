require 'aws-sdk-ec2'

ec2 = Aws::EC2::Resource.new(region: 'eu-central-1')

result = ec2.snapshots.select do |snapshot|
  result = snapshot.tags.find do |tag|
    tag.key == "delete_backup_on"
  end
  !!result
end

result.each do |i|
  puts i.inspect
end

