# Jungle

A mini e-commerce application built with Rails 4.2, with an empasihis on learning:

- Ruby and the Rails framework
- how to navigate an existing code-base
- the importance of using existing code style and approach to implement new features in unfamiliar territory
- how to apply previous learning tactics to research and become familiar with a new paradigm, language and framework
- real world situations where feature and bug-fix requests are listed, and are not step-by-step instructions on how to implement a solution

# Features

- Admin users can list and create new categories.
- Admins can add new products using the new category.
- Admin can add and remove sales, and a banner will ntify if a sale is current.
- User must enter HTTP auth login/password to access admin functionality.
- Visitors can go to the registration page from any page in order to create an account.
- Visitors can sign up for a user account with my e-mail, password, first name and last name
- If the email is already in the database, it can not be used.
- Passwords are encrypted using bcrypt.
- Visitors can sign in using e-mail and password.
- Users can log out from any page.
- The order page contains items, their image, name, description, quantities and line item totals.
- The final amount for the order is displayed.
- If the cart is empty, when viewed, messge and a link to redirect to continue shopping.

## Screenshots

!["Order"](https://github.com/mikeackison/jungle-rails/blob/master/public/screenshots/Order.png?raw=true)
!["Admin"](https://github.com/mikeackison/jungle-rails/blob/master/public/screenshots/Admin.png?raw=true)
!["Products"](https://github.com/mikeackison/jungle-rails/blob/master/public/screenshots/Products.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
