set :stages, %w(testing production)
set :default_stage, "production"

set :application, "jira_webhook_inspector"
set :repository,  "git@github.com:BrianMehrman/jira_webhook_inspector.git"


set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names

set :user, "ubuntu"

set :deploy_to, "/var/www/jira_webhook_inspector"

desc "check production task"
task :check_production do
  if stage.to_s == "production"
    puts " \n Are you sure you want to deploy to Production"
    puts " \n Enter the password to continue\n"

    password= STDIN.gets.chomp rescue nil

    if password != "password"
      puts "\n !!! WRONG PASSWORD !!!"
      exit
    end
  end
end

role :web, "ec2-54-184-196-55.us-west-2.compute.amazonaws.com"
role :app, "ec2-54-184-196-55.us-west-2.compute.amazonaws.com"
role :db, "ec2-54-184-196-55.us-west-2.compute.amazonaws.com"

before "deploy", "check_production"


