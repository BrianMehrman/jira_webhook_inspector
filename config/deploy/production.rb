set :user, "ubuntu"
server "ec2-54-184-196-55.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["~/.ssh/pem/TimeEntryPOC.pem"]
