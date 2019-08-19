server "167.99.226.66", user: "deploy", roles: %w{app db web}
set :rails_env, 'production'
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/packs", "node_modules", 'config/credentials', '.bundle'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/env.yml', 'config/master.key', 'config/credentials/yml.enc')