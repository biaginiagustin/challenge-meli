FROM ruby:2.6.8

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
ENV BUNDLER_FROZEN=true
RUN gem install bundler && bundle install --without test

COPY . ./

CMD ["rackup", "-p", "8080", "-o", "0.0.0.0"]