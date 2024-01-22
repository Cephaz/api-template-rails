# Build: docker build -t rails-app .
FROM ruby:3.2.0

# Rails app lives here
WORKDIR /app

# Install packages needed to build gems
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Entrypoint prepares the database.
ENTRYPOINT ["./bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
