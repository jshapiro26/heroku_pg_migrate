## heroku_pg_migrate
### What does it do?
This image will run `heroku pg:pull` on your source app and restore it to a local postgres server running in the container. It will then run `heroku pg:reset` on the destination app deleting all content in the database. Next It will run a `heroku pg:push` to your destination app which restores all content from the source app. 
### How to use this container
- ensure you're logged into the heroku tool belt on your local machine with `docker login`
- `docker pull heroku-pg-migrate`
- `docker run -v ~/.netrc:/root/.netrc heroku-pg-migrate <source_app_name> <destination_app_name>
