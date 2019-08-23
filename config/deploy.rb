# config valid for current version and patch releases of Capistrano
set :application, "MainSite"
set :repo_url, "git@github.com:adubov1/MainSite.git"
set :ssh_options, keys: ["config/deploy_id_rsa"] if File.exist?("config/deploy_id_rsa")
set :use_sudo, false
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "~/site"
# set :puma_rackup, -> { File.join(current_path, 'config.ru') }
# set :puma_conf, "#{shared_path}/puma.rb"
# set :puma_role, :web
set :rbenv_ruby, '2.6.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/bin/rbenv exec"
set :default_env, {
    'RAILS_MASTER_KEY':'8b9f62cecaf3213135e0ed682abb3001',
    'SECRET_KEY_BASE':'8b9f62cecaf3213135e0ed682abb3001',
    'DATABASE_PASSWORD':'alex2002'
}

# set :rvm_ruby_version, '2.6.0'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2
before "deploy:assets:precompile", "deploy:bundle_fix"
namespace :deploy do
  desc "Fix Gemfile.lock"
  task :bundle_fix do
    execute("cd #{release_path} && mv Gemfile.lock Gemfile.lock.old && bundle lock --no-deployment")
  end
end
# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
