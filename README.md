# Jungle

## Main Page View:
***
![Jungle](https://github.com/ahmaddaadaa/jungle-rails/blob/master/docs/jungle.png?raw=true)
***
A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Run `npx cypress open` to start Cypress

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## New Dependencies (Updated)

- Rails ActionCable (Version ^6.0.0)
- Rails ActiveStorage (Version ^6.0.0)
- Rails UJS (Version ^6.0.0)
- Rails Webpacker (Version 5.4.0)
- Turbolinks (Version ^5.2.0)
- Webpack (Version ^4.46.0)
- Webpack CLI (Version ^3.3.12)

## New Dev Dependencies

- Cypress (Version ^9.7.0)
- Webpack Dev Server (Version ^3.11.2)