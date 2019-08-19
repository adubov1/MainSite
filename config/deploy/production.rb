server "167.99.226.66", user: "deploy", roles: %w{app db web}
set :rails_env, 'production'
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/packs", ".bundle", "node_modules", '.bundle', 'credentials'
append :linked_files, "config/database.yml"