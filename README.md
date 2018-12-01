# CommonMarker+Rouge

[![Gem](https://img.shields.io/gem/v/commonmarker-rouge.svg?maxAge=2592000)](https://rubygems.org/gems/commonmarker-rouge)
[![Travis](https://img.shields.io/travis/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://travis-ci.org/sandfoxme/commonmarker-rouge)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://codeclimate.com/github/sandfoxme/commonmarker-rouge)
[![Code Climate](https://img.shields.io/codeclimate/c/sandfoxme/commonmarker-rouge.svg?maxAge=2592000)](https://codeclimate.com/github/sandfoxme/commonmarker-rouge/coverage)

A [CommonMarker](https://rubygems.org/gems/commonmarker) wrapper with
syntax highlight support by [Rouge](https://rubygems.org/gems/rouge).

## IMPORTANT

`commonmarker-rouge` currently works only with renderer in `:UNSAFE` mode.
Don't forget to set `:UNSAFE` manually if you're overwriting the renderer mode.

If you know how to fix this behavior please comment in [Issue #5](https://github.com/sandfoxme/commonmarker-rouge/issues/5)

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'commonmarker-rouge'
```

## Usage

Review the CommonMarker options to understand how to use the `render_html` command:

* 1st parameter (optional) - [parse options](https://github.com/gjtorikian/commonmarker#parse-options)
* 2nd parameter (optional) - [render options](https://github.com/gjtorikian/commonmarker#render-options)
* 3rd parameter (optional) - [extensions](https://github.com/gjtorikian/commonmarker#extensions)

```ruby
# use default CommonMarker class and Rouge::Formatters::HTML formatter
CommonMarker::Rouge.render_html(content)

# Basic examples with 1st and 2nd optional parameters
CommonMarker::Rouge.render_html(content), [:DEFAULT], [:UNSAFE])
CommonMarker::Rouge.render_html(content, [:DEFAULT], [:SOURCEPOS])
CommonMarker::Rouge.render_html(content, [:DEFAULT], [:UNSAFE, :SOURCEPOS])

# use GitHub extensions - both 1st/2nd parameters required
CommonMarker::Rouge.render_html(content), [:DEFAULT], [:DEFAULT], [:table])
CommonMarker::Rouge.render_html(content), [:DEFAULT], [:DEFAULT], [:table, :strikethrough])
CommonMarker::Rouge.render_html(content), [:DEFAULT], [:DEFAULT], [:table, :strikethrough, :autolink])
CommonMarker::Rouge.render_html(content), [:DEFAULT], [:DEFAULT], [:table, :strikethrough, :tagfilter])

# get CommonMarker parsed AST
CommonMarker::Rouge.render_doc(content)

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
