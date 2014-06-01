bind 'unix:///tmp/puma.rubyjobs.sock'
environment (ENV['RAILS_ENV'] || 'production' )
threads 4, 4
workers 2
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end