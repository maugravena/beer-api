FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN mkdir /beer-api
WORKDIR /beer-api
COPY Gemfile /beer-api/Gemfile
COPY Gemfile.lock /beer-api/Gemfile.lock
RUN bundle install
COPY . /beer-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

