# config valid only for Capistrano 3.3.5
lock '3.3.5'

set :application, 'payphonehome-www'
set :organization, 'urlgrey'
set :repo_url, 'git@github.com:urlgrey/payphonehome-www.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/opt/payphonehome-www'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
#set :format, :dot

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/config.json}

# Default value for linked_dirs is []
set :linked_dirs, %w{log pids}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :default_env, {
  'PATH' => "/opt/rubies/2.1.3/bin:$PATH"
}

namespace :deploy do
  desc 'Prepare host for application'
  task :cold do
    on roles(:util) do
      execute "if [[ ! -d /opt/#{fetch(:application)} ]]; then sudo mkdir -p /opt/#{fetch(:application)}; sudo mkdir -p /opt/#{fetch(:application)}/shared/log; sudo mkdir /opt/#{fetch(:application)}/releases; sudo chown -R ec2-user.ec2-user /opt/#{fetch(:application)}; fi"
    end
  end
end
