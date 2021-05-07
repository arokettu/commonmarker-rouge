# CommonMarker+Rouge

[![Gem](https://img.shields.io/gem/v/commonmarker-rouge.svg?style=flat-square)](https://rubygems.org/gems/commonmarker-rouge)
[![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline/sandfox/commonmarker-rouge/master.svg?style=flat-square)](https://gitlab.com/sandfox/commonmarker-rouge/-/pipelines)

A [CommonMarker](https://rubygems.org/gems/commonmarker) wrapper with
syntax highlight support by [Rouge](https://rubygems.org/gems/rouge).

## IMPORTANT

`commonmarker-rouge` currently works only with renderer in `:UNSAFE` mode.
Don't forget to set `:UNSAFE` manually if you're overwriting the renderer mode.

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'commonmarker-rouge'
```

## Documentation

Read full documentation here: <https://sandfox.dev/ruby/commonmarker-rouge.html>

## Support

Please file issues on our main repo at GitLab: <https://gitlab.com/sandfox/commonmarker-rouge/-/issues>

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
