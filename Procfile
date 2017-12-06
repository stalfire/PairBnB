redis: redis-server
worker: bundle exec sidekiq -q default -q mailers
web: heroku run rails bd:migrate