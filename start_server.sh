#!/bin/sh
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

while ! rake db:create; do sleep 3; done
rake db:migrate
rake db:seed

bundle exec rails s -b 0.0.0.0