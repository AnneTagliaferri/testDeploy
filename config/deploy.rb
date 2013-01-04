## Basic  multi-staging capistrano configuration
#
# prompt ssh password
default_run_options[:pty] = true

# SSH conf
ssh_options[:forward_agent] = true

# Git
set :github_user, 'Hubee'
set :github_application, "web-dorcelvision"
set :repository,  "git@github.com:#{github_user}/#{github_application}.git"
set :scm, 'git'
set :git_shallow_clone, 1

# Debug
set :scm_verbose, true
set :use_sudo, false


# Multi-staging configuration
# cap production  deploy
task :production do
  role :web, "www.domain.com"
  # SSH
  set :user, ''  #ssh login
  set :domain, '' #your ip/server  
  set :application, 'Dorcel' #app name 
  set :deploy_to, "prod/" #deploypath
  set :deploy_via, :remote_cache
  set :branch, 'master'
  
end
#cap staging deploy
task :staging do
  role :web, "localhost"
  # SSH
   set :user, ''  
   set :domain, ''  
   set :application, 'Dorcel'  
  set :deploy_to, "staging/"
  set :deploy_via, :copy
  set :branch, 'master' #for staging we might want to use the dev branch
   
end
 
 

# Override default tasks which are not relevant to a non-rails app.
namespace :deploy do
  task :migrate do
    puts "    not doing migrate because not a Rails application."
  end
  task :finalize_update do
    puts "    not doing finalize_update because not a Rails application."
  end
  task :start do
    puts "    not doing start because not a Rails application."
  end
  task :stop do 
    puts "    not doing stop because not a Rails application."
  end
  task :restart do
    puts "    not doing restart because not a Rails application."
  end
end

