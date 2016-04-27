# catalyst-analytics-tool

This is just another Very simple analytics tool.

## What is it?

1. Put <img src="http://yourserver.com/logger.png?any=parameter&you=want" width="1" height="1"> to your site
2. User's browser will get 1x1 pixel transparent PNG file (this goes through any proxy you can think of)
3. Parameters will be stored on JSON column, with time of the event

## REST interface

There's REST interface to browse the data:
http://yourserver.com/rest/request

## Deployment

To deploy this Catalyst app to Heroku, create a new app:

    heroku create my-app-name \
        --region eu \
        --buildpack http://github.com/pnu/heroku-buildpack-perl.git \
        --addons heroku-postgresql

Just *git push heroku master* to go!

## Further reading

Based on ngbp-on-catalyst:
https://github.com/pnu/ngbp-on-catalyst
