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

CMD ["bash","-c","sleep 40 && rm -f tmp/pids/server.pid && bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed && bundle exec rails s -b '0.0.0.0'"]
