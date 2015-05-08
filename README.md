[![Code Climate](https://codeclimate.com/github/katebeavis/yelp/badges/gpa.svg)](https://codeclimate.com/github/katebeavis/yelp) [![Test Coverage](https://codeclimate.com/github/katebeavis/yelp/badges/coverage.svg)](https://codeclimate.com/github/katebeavis/yelp/coverage) [![Build Status](https://travis-ci.org/katebeavis/yelp.svg?branch=master)](https://travis-ci.org/katebeavis/yelp)
# Yelp Clone

Yelp Clone is...a clone of Yelp! It was the week 9 project at Makers Academy.

This app enables users to sign up and log in with either their email or Facebook. They are able to add a restaurant and upload a picture at the same time. Users can then leave reviews by the means of comments and a star rating. The average rating will then been displayed.

## Objectives
This project introduced us to the magic of Rails and the structure, including the MVC, routers and helpers. I finally felt, through this project, that my understanding of the MVC design pattern started to fall into place.

We were also introduced to Omniauth, Devise and AWS. I think this project really opened up my eyes to how an amazing app can be be created with just a few gems and, well, a lot of code!

## Technology
- Ruby
- Rails
- PostgreSQL
- Rspec
- Capybara
- Omniauth
- Devise
- Paperclip
- AWS

## To Run
```
$ git clone https://github.com/katebeavis/yelp.git
$ cd yelp
$ bundle install
$ rake db:create db:migrate
$ rails s
visit http://localhost:3000
```

## To Run Tests
```
$ rspec
```
