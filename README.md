# Example deploying a Panel app to Heroku using Docker

The default build environment on Heroku uses `pip` to install Python packages. 
Some Python packages cannot be installed via `pip`, particularly if they need
to be compiled (`cartopy` is one example).

This example uses Heroku and Docker containers to install dependencies using a conda environment instead of `pip`.

To get started working with Heroku [signup](https://signup.heroku.com) for a
free account and [download and install the
CLI](https://devcenter.heroku.com/articles/getting-started-with-python#set-up).
Once you are set up follow the instructions to log into the CLI.

1. Log in to heroku on the command line by running `heroku login`. This should prompt you to open a browser and you can log in with your credentials.

2. Create you app with heroku. From the main folder of your repository run:

```
heroku create APP_NAME
```

3. Configure the heroku build step to use Docker. 

```
heroku stack:set container
```

4. Update the `environment.yml` file to include all of the dependencies that your app notebook needs. 

5. Update the `run` command in `heroku.yml` to use the `APP_NAME` from the previous step: 


```--allow-websocket-origin=APP_NAME.herokuapp.com```


Also, make sure the name of the 

```
web: panel serve --address="0.0.0.0" --port=$PORT app.ipynb --allow-websocket-origin=app-name.herokuapp.com
```

In this repository, I have specified "APP_NAME" as "gentle-earth-18442" but you should replace your "app-name" with whatever you want yours to be.


6. Add the files to the repository:

```
git add .
git ci -a -m 'adding files to repository'
```

7. Push the app to heroku and wait until it is deployed. From the main folder of your repository, run the following
   command from the command line:

```
git push heroku main
```

**Note!** the process of creating the conda environment can take a long time (> 10 minutes), expecially if you have a lot of packages to install.

7. Visit the app at APP_NAME.herokuapp.com
