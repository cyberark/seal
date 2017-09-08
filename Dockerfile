FROM ruby:2.2.6-alpine
RUN apk add --no-cache build-base
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test
COPY . ./
ENTRYPOINT ["bundle", "exec", "bin/seal.rb"]
