# CommonMarker+Rouge

[![Gem Version](https://badge.fury.io/rb/commonmarker-rouge.svg)](https://badge.fury.io/rb/commonmarker-rouge)
[![Code Climate](https://codeclimate.com/github/sandfoxme/commonmarker-rouge/badges/gpa.svg)](https://codeclimate.com/github/sandfoxme/commonmarker-rouge)

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
CommonMarker::Rouge.render_html(content, [:normalize, :sourcepos])

# use custom CommonMarker wrapper (must provide compatible render_doc)
CommonMarker::Rouge.render_html(content, cmark_class: CommonMarkerWrapper)

# use custom Rouge formatter
CommonMarker::Rouge.render_html(content, formatter: Rouge::Formatters::HTMLLinewise)

# pass some options to Rouge
CommonMarker::Rouge.render_html(content, options: { css_class: 'custom-class' })
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

