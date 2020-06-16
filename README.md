# CommonMarker+Rouge

[![Gem](https://img.shields.io/gem/v/commonmarker-rouge.svg?maxAge=2592000)](https://rubygems.org/gems/commonmarker-rouge)
[![Travis](https://img.shields.io/travis/arokettu/commonmarker-rouge.svg?maxAge=2592000)](https://travis-ci.org/arokettu/commonmarker-rouge)

A [CommonMarker](https://rubygems.org/gems/commonmarker) wrapper with
syntax highlight support by [Rouge](https://rubygems.org/gems/rouge).

## IMPORTANT

`commonmarker-rouge` currently works only with renderer in `:UNSAFE` mode.
Don't forget to set `:UNSAFE` manually if you're overwriting the renderer mode.

If you know how to fix this behavior please comment in [Issue #5](https://github.com/arokettu/commonmarker-rouge/issues/5)

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'commonmarker-rouge'
```

## Documentation

Read full documentation here: <https://sandfox.dev/ruby/commonmarker-rouge.html>

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
