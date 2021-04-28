# local_wp

Some example files to get a local dockerized instance running of an existing WordPress site.

Runs both database and server as containers.

In order to not run into issues with `localhost` on the containers vs the actual OS, it's better to use an alias domain that can be set in `/etc/hosts`

For example, add an entry like this to `/etc/hosts`:

```
127.0.0.1 dev.local.com
```

## Usage

1. In a given local directory you want to have a copy of this docker-compose file, a subdirectory with your wp files, and a database dump out of mysql/mariadb.

2. Edit `wp-config.php` file within your wp subdirectory with names/creds for your local db

3. Also add to it two lines like the following:
   
   ```
   define('DB_NAME', 'local_db');
   define('DB_USER', 'local_user');
   define('DB_PASSWORD', 'local_pass');
   define('DB_HOST', 'local_db');
   
   define( 'WP_HOME', 'http://dev.local.com' );
   define( 'WP_SITEURL', 'http://dev.local.com' );
   ```

## Replacing URLs

You can optionally use the `search_and_replace.sql` file which can be run on your db to replace urls with the value of your choosing. 

and then you can replace all your `https://mysite.com`'s with `http://dev.local.com`.

Before running that script you will most likely have to edit it to make the table names match yours and set the before and after URLs. To know what yours are either open up your mysql console in the running container OR have a look at your `wp_config.php` file to find the table prefix.

## Troubleshooting

- Loading the site sends you to the WP installation wizard, then it's likely your db isn't getting correctly imported. `docker exec -it <container id> bash` into your db container to check if your tables exist.
  
  In that case, check docker-compose output to see if import is failing on something.
