FROM ruby:3.2.2

WORKDIR /app

COPY main.rb Gemfile Gemfile.lock ./

RUN bundle install

CMD ["ruby", "main.rb"]
