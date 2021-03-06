# PoroProperties
[![Build Status][ci-image]][ci]
[![Code Climate][cc-image]][cc]

Allows you to define properties on your Ruby classes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'poro_properties'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install poro_properties

## Usage

You must require 'poro_properties' and then include it on your class:

```ruby
require 'poro_properties'

class MyClass
  include PoroProperties

  properties :foo, :bar
  property :baz
end
```

When you include PoroProperties, the following methods are available on your
class:

```ruby
MyClass.properties_names
MyClass.new.to_h
```

You can also pass default values:

```ruby
require 'poro_properties/defaults'

class MyClass
  include PoroProperties
  include PoroProperties::Defaults

  property :foo, default: 'bar'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git commits
and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/estoulendo/poro_properties/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[ci-image]:https://travis-ci.org/estoulendo/poro_properties.svg?branch=master
[ci]:https://travis-ci.org/estoulendo/poro_properties
[cc-image]:https://codeclimate.com/github/estoulendo/poro_properties/badges/gpa.svg
[cc]:https://codeclimate.com/github/estoulendo/poro_properties
