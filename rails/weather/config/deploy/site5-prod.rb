set :application, "weather"

set :user, "tom"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")] 
#ssh_options[:port] = 7822

# fixes host verification problem
default_run_options[:pty] = true

set :use_sudo, false

# Site5 blocks execution of scripts (i.e., dispatch.fcgi) that are
# group writable.  By default, Capistrano sets everything group
# writable.  This stops that.
set :group_writable, false

set :repository,  "http://tom@home.tom.org:8081/svn-repos/weather/trunk/rails/#{application}"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "~/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :subversion
# set :scm_username, "#{user}"
#set :scm_password, proc{Capistrano::CLI.password_prompt('SVN pass:')} 

set :deploy_via, :export 

role :app, "tommitchell.net"
role :web, "tommitchell.net"
role :db,  "tommitchell.net", :primary => true

#role :app, "dev"
#role :web, "dev"
#role :db,  "dev", :primary => true

#todo: copy database.yml
# cp ~/apps/weather/config/database.yml ~/cap/weather/shared/system/
# make system the permanent place and do a ln on deployment
#desc "Symlink config.yml and database.yml from shared to  current directory
#      since it should not be kept in version control"
task :symlink_config_yml, :roles => :app do
  run "ln -nsf #{shared_path}/config/database.yml
       #{release_path}/config/database.yml"
  run "ln -nsf #{shared_path}/config/config.yml
       #{release_path}/config/config.yml"
end

#desc "Symlink root directory under public_html"
task :symlink_public, :roles => :app do
  run "ln -nsf #{current_path}/public
       /home/#{user}/public_html"
end

# TODO: copy current images (like tide, graphs) out of public/images to current/images
# 
#desc "chmod +x dispatch.fcgi"
task :chmod_files, :roles => :app do
  run "chmod +x #{release_path}/public/dispatch.fcgi"
  run "chmod +x #{release_path}/script/*"
end

after 'deploy:update_code', 'chmod_files', 'symlink_config_yml', 'symlink_public'

namespace(:deploy) do
  desc "Shared dispatch.fcgi restart"
  task :restart, :roles => :app do
    send(run_method, "skill -9 -u #{user} -c dispatch.fcgi")
  end
end

desc "tail -f development log"
task :tail_dev_log, :roles => :app do 
  stream "tail -f #{shared_path}/log/development.log" 
end 

desc "tail -f production log"
task :tail_prod_log, :roles => :app do
  stream "tail -f #{shared_path}/log/production.log"
end

desc "reset awstats config"
task :reset_awstata, :roles => :app do
    send(run_method, "cp ~/tmp/awstats/awstats.tom.org.conf.good ~/tmp/awstats/awstats.tom.org.conf")
end
