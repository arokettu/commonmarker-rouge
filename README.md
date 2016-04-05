# HighMarker

[![Gem Version](https://badge.fury.io/rb/highmarker.svg)](https://badge.fury.io/rb/highmarker)
[![Code Climate](https://codeclimate.com/github/sandfoxme/highmarker/badges/gpa.svg)](https://codeclimate.com/github/sandfoxme/highmarker)

A [CommonMarker](https://rubygems.org/gems/commonmarker) wrapper with
syntax highlight support. Syntax highlight is provided by either
[Rouge](https://rubygems.org/gems/rouge) or 
[CodeRay](https://rubygems.org/gems/coderay).

## Using with Rouge

Rouge is a recommended option but neither of the highlighters are added 
as strong dependencies so you should require them explicitly.

### Installation

Add these lines to your application's Gemfile:

```ruby
gem 'highmarker'
gem 'rouge'
```

### Usage

```ruby
# use default CommonMarker class and Rouge::Formatters::HTML formatter
HighMarker::Rouge.render_html(content)

# get CommonMarker parsed AST
HighMarker::Rouge.render_doc(content)

# pass options to CommonMarker
HighMarker::Rouge.render_html(content, [:normalize, :sourcepos])

# use custom CommonMarker wrapper (must provide compatible render_doc)
HighMarker::Rouge.render_html(content, cmark_class: CommonMarkerWrapper)

# use custom Rouge formatter
HighMarker::Rouge.render_html(content, formatter: Rouge::Formatters::HTMLLinewise)

# pass some options to Rouge
HighMarker::Rouge.render_html(content, options: { css_class: 'custom-class' })
```

## Using with CodeRay

CodeRay support is incomplete and experimental.

### Installation

Add these lines to your application's Gemfile:

```ruby
gem 'highmarker'
gem 'coderay'
```

### Usage

```ruby
# use default CommonMarker class
HighMarker::CodeRay.render_html(content)

# get CommonMarker parsed AST
HighMarker::CodeRay.render_doc(content)

# pass options to CommonMarker
HighMarker::CodeRay.render_html(content, [:normalize, :sourcepos])

# use custom CommonMarker wrapper (must provide compatible render_doc)
HighMarker::CodeRay.render_html(content, cmark_class: CommonMarkerWrapper)
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

