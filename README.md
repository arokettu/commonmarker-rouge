# CommonMarker+Rouge

[![Gem](https://img.shields.io/gem/v/commonmarker-rouge.svg?maxAge=2592000)](https://rubygems.org/gems/commonmarker-rouge)
[![Travis](https://img.shields.io/travis/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://travis-ci.org/sandfoxme/commonmarker-rouge)
[![Code Climate](https://img.shields.io/codeclimate/github/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://codeclimate.com/github/sandfoxme/commonmarker-rouge)
[![Code Climate](https://img.shields.io/codeclimate/coverage/github/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://codeclimate.com/github/sandfoxme/commonmarker-rouge/coverage)
[![Gemnasium](https://img.shields.io/gemnasium/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://gemnasium.com/sandfoxme/commonmarker-rouge)

A [CommonMarker](https://rubygems.org/gems/commonmarker) wrapper with
syntax highlight support by [Rouge](https://rubygems.org/gems/rouge).

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'commonmarker-rouge'
```

## Usage

```ruby
# use default CommonMarker class and Rouge::Formatters::HTML formatter
CommonMarker::Rouge.render_html(content)

# get CommonMarker parsed AST
CommonMarker::Rouge.render_doc(content)

# pass options to CommonMarker
CommonMarker::Rouge.render_html(content, [:SAFE, :SOURCEPOS])

# use custom CommonMarker wrapper (must provide compatible render_doc)
CommonMarker::Rouge.render_html(content, cmark_class: CommonMarkerWrapper)

# use custom Rouge formatter by class
CommonMarker::Rouge.render_html(content, formatter_class: Rouge::Formatters::HTMLLinewise)
# or by instance
CommonMarker::Rouge.render_html(content, formatter: Rouge::Formatters::HTMLTable.new(
  Rouge::Formatters::HTML.new
))

# pass some options to Rouge
CommonMarker::Rouge.render_html(content, options: { css_class: 'custom-class' })
# or
CommonMarker::Rouge.render_html(content, formatter: Rouge::Formatters::HTMLTable.new(
  Rouge::Formatters::HTML.new, code_class: 'rouge-code'
))

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

