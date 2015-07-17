# Errawr::Rails

Raise and render errors in Rails using Errawr

[![Build Status](https://travis-ci.org/anthonator/errawr-rails.png?branch=master)](https://travis-ci.org/anthonator/errawr-rails) [![Dependency Status](https://gemnasium.com/anthonator/errawr-rails.png)](https://gemnasium.com/anthonator/errawr-rails) [![Coverage Status](https://coveralls.io/repos/anthonator/errawr-rails/badge.png?branch=master)](https://coveralls.io/r/anthonator/errawr-rails?branch=master) [![Code Climate](https://codeclimate.com/github/anthonator/errawr-rails.png)](https://codeclimate.com/github/anthonator/errawr-rails)

## Installation

Add this line to your application's Gemfile:

    gem 'errawr-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install errawr-rails

## Usage

### Getting Started

To start raising errors in Rails just include ```Errawr::Rails``` in a controller. This will provide access to the ```#error!``` method in your controller.

```ruby
class SomeController < ApplicationController
  include Errawr::Rails

  def index
    if params[:dont_work] == true
      error!(:bad_request)
    end
  end
end
```

### Rendering Error Responses

If you'd like to catch and render errors in a particular format include ```Errawr::Rails``` using the ```#with_renderer``` method.

```ruby
class SomeController < ApplicationController
  include Errawr::Rails.with_renderer(Errawr::Rails::Renderers::JSON)

  def index
    if params[:dont_work] == true
      error!(:bad_request)
    end
  end
end
```

The above example will render the error as JSON using the following format:

```json
{
  "error": "bad_request",
  "description": "Bad Request"
}
```

Depending on what renderer is used additional metadata may be added to the response output:

```ruby
class SomeController < ApplicationController
  include Errawr::Rails.with_renderer(Rails::Errawr::Renderers::JSON)

  def index
    if params[:dont_work] == true
      error!(:bad_request, metadata: { extra_info: 'I like candy' })
    end
  end
end
```

```json
{
  "error": "bad_request",
  "description": "Bad Request",
  "extra_info": "I like candy"
}
```

Currently the only renderer that ships with Errawr::Rails is ```Rails::Errawr::Renderers::JSON```.


### Custom Renderers

To create a custom renderer simple create a class with that specifies a ```call``` method that accepts a single parameter. The method can return anything that the Rails ```render``` method will accept.

```ruby
class MyCustomRenderer
  def call(error)
  {
    json: {
      hello: 'world'
    }
  }
  end
end
```

```ruby
class SomeController < ApplicationController
  include Errawr::Rails.with_renderer(MyCustomRenderer)

  def index
    if params[:dont_work] == true
      error!(:bad_request)
    end
  end
end
```

```json
{
  "hello": "world"
}
```

### HTTP Status Codes

Errawr::Rails uses the [Errawr::HTTP](https://github.com/anthonator/errawr-http) gem to add support for [4xx](https://github.com/anthonator/errawr-http#supported-4xx-status-codes) and [5xx](https://github.com/anthonator/errawr-http#supported-5xx-status-codes) HTTP status code errors.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

[![Sticksnleaves](http://sticksnleaves-wordpress.herokuapp.com/wp-content/themes/sticksnleaves/images/snl-logo-116x116.png)](http://www.sticksnleaves.com)

Errawr::Rails is maintained and funded by [Sticksnleaves](http://www.sticksnleaves.com)

Thanks to all of our [contributors](https://github.com/anthonator/errawr-rails/graphs/contributors)
