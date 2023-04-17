FROM ruby:3.0.6

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.3.8
RUN bundle install
#RUN bundle update
COPY . /myapp

EXPOSE 4567

CMD ["bundle", "exec", "foreman", "start"]
