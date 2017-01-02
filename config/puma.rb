# frozen_string_literal: true

environment ENV.fetch('RACK_ENV') { 'deployment' }

threads ENV.fetch('PUMA_MIN_THREADS') { 5 }.to_i,
        ENV.fetch('PUMA_MAX_THREADS') { 5 }.to_i
workers ENV.fetch('PUMA_WORKERS') { 2 }.to_i

bind ENV.fetch('PUMA_SOCKET') { 'unix:///tmp/puma.rubyjobs.sock' }

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

preload_app!
