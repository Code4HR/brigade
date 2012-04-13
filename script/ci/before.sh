#!/bin/bash

# Create a database.yml for the right database
echo "Setting up database.yml for $DB"
cp config/database.yml.example config/database.yml
if [ "$DB" = "postgres" ]; then
  sed -i 's/*mysql/*postgres_travis/' config/database.yml
fi

# Set up database
echo "Creating databases for $DB and loading schema"
bundle exec rake db:create --trace
bundle exec rake db:schema:load --trace
