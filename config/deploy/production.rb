set :branch,      ENV['REF'] || "master"
server ENV['SERVER'] || "54.174.102.95", user: 'ec2-user', roles: %w{util}, primary: :true
