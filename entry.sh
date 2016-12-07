#!/bin/bash
# Start postgres
source ~/.profile
source ~/.bash_profile
rm -rf /var/lib/pgsql/9.6/data/postmaster.pid
runuser -l postgres --session-command "/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/9.6/data -l logfile start"
sleep 15
# Pull current db into container
PGUSER=postgres heroku pg:pull DATABASE_URL mydb -a $1
echo "database from $1 has been pulled"
# Delete all data in existing destination postgres add-on
heroku pg:reset DATABASE_URL -a $2 --confirm $2
echo "the database on $2 has been reset"
# Push into 
PGUSER=postgres heroku pg:push mydb DATABASE_URL -a $2
echo "database has been pushed to $2"