workers Integer(ENV['WEB_CONCURRENCY'] || 3)
threads_count = Integer(ENV['THREAD_COUNT'] || 5)
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'
