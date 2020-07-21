CommonMarker+Rouge
##################

|RubyGems| |GitLab| |GitHub| |Bitbucket| |Gitea|

A CommonMarker_ wrapper with syntax highlight support by Rouge_.

.. important::
    ``commonmarker-rouge`` currently works only with renderer in ``:UNSAFE`` mode.
    Don't forget to set ``:UNSAFE`` manually if you're overwriting the renderer mode.

Installation
============

Add these lines to your application's Gemfile:

.. code-block:: ruby

    gem 'commonmarker-rouge'

Usage
=====

Review the CommonMarker options to understand how to use the ``render_html`` command:

* 1st parameter (optional) - `parse options`_
* 2nd parameter (optional) - `render options`_
* 3rd parameter (optional) - `extensions`_

.. code-block:: ruby

    # use default CommonMarker class and Rouge::Formatters::HTML formatter
    CommonMarker::Rouge.render_html(content)

    # Basic examples with 1st and 2nd optional parameters
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:UNSAFE])
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:SOURCEPOS])
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:UNSAFE, :SOURCEPOS])

    # use GitHub extensions - both 1st/2nd parameters required
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:DEFAULT], [:table])
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:DEFAULT], [:table, :strikethrough])
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:DEFAULT], [:table, :strikethrough, :autolink])
    CommonMarker::Rouge.render_html(content, [:DEFAULT], [:DEFAULT], [:table, :strikethrough, :tagfilter])

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

Support
=======

Please file issues on our main repo at GitLab: https://gitlab.com/sandfox/commonmarker-rouge/-/issues

License
=======

The gem is available as open source under the terms of the `MIT License`_.

.. _CommonMarker:   https://rubygems.org/gems/commonmarker
.. _Rouge:          https://rubygems.org/gems/rouge
.. _MIT License:    http://opensource.org/licenses/MIT

.. _parse options:  https://github.com/gjtorikian/commonmarker#parse-options
.. _render options: https://github.com/gjtorikian/commonmarker#render-options
.. _extensions:     https://github.com/gjtorikian/commonmarker#extensions

.. |RubyGems|   image:: https://img.shields.io/gem/v/commonmarker-rouge.svg
   :target:     https://rubygems.org/gems/commonmarker-rouge
.. |GitHub|     image:: https://img.shields.io/badge/get%20on-GitHub-informational.svg?logo=github
   :target:     https://github.com/arokettu/commonmarker-rouge
.. |GitLab|     image:: https://img.shields.io/badge/get%20on-Gitlab-informational.svg?logo=gitlab
   :target:     https://gitlab.com/sandfox/commonmarker-rouge
.. |Bitbucket|  image:: https://img.shields.io/badge/get%20on-Bitbucket-informational.svg?logo=bitbucket
   :target:     https://bitbucket.org/sandfox/commonmarker-rouge
.. |Gitea|      image:: https://img.shields.io/badge/get%20on-Gitea-informational.svg
   :target:     https://sandfox.org/sandfox/commonmarker-rouge
