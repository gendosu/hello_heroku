#!/bin/bash

/usr/local/rbenv/shims/bundle

rm /products/tmp/pids/*.pid

# /usr/local/rbenv/shims/rails s -b 0.0.0.0 -p 3000
/usr/local/rbenv/shims/bundle exec foreman start
