FROM ruby:2.6.5
RUN apt-get update 
RUN apt-get install default-libmysqlclient-dev

RUN gem update --system
RUN gem install mysql2
RUN gem install bundle
RUN gem install bundler

RUN mkdir /users-ms
WORKDIR /users-ms
ADD Gemfile /users-ms/Gemfile
ADD Gemfile.lock /users-ms/Gemfile.lock
RUN bundle install
ADD . /users-ms