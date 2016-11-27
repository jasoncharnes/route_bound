# RouteBound
Rails needs some more magic, right? RouteBound is implicit model binding for Ruby on Rails. RouteBound will use a route to try and load a resource for you.

This gem is still very young. It was inspired by [Laravel's implicit model binding](https://laravel.com/docs/5.3/routing#route-model-binding).

## Usage
Implicit model binding will try to load the requested resource for you. In the following example:

```ruby
  # config/routes.rb
  get 'products/:id', to: 'products#show'
```

```ruby
  # app/controllers/products_controller.rb
  class ProductsController < ApplicationController
    include RouteBound

    def show
    end
  end
```

If you go to `/products/1`, you will have access to `@product` without having to explicitly call `Product.find(params[:id])`. It's already been done for you.

If it can't find the resource, it will silently continue on as normal and will log out to the Rails logger.

### Caveats
These are hopefully just temporary.
* It doesn't _currently_ work with nested resources
* It doesn't _currently_ allow you to override the query to load the resource

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'route_bound'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install route_bound
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
