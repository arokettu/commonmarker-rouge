require 'commonmarker'
require 'rouge'
require 'coderay'

content = <<-MD
[link](http://example.com/)

Here's codeblock:

```
codeblock 1
```

Here's another codeblock:

    codeblock 2

Here's codeblock we're here about:

```c
#include <whatever.h>

int main() {
  return "codeblock to be highlighted";
}
```

---
MD

style = '<link rel="stylesheet" href="main.css">'

html = CommonMarker.render_doc(content, :default).to_html

File.write('tmp/commonmark-vanilla.html', style+html)

ast_for_rouge = CommonMarker.render_doc(content, :default)

ast_for_rouge.walk do |node|
  if node.type == :code_block
    next if node.fence_info == ''

    source = node.string_content

    lexer = Rouge::Lexers::C.new
    formatter = Rouge::Formatters::HTML.new(wrap: false)

    html = '<div class="highlighter-rouge"><pre class="highlight"><code>' + formatter.format(lexer.lex(source)) + '</code></pre></div>'

    new_node = CommonMarker::Node.new(:html)
    new_node.string_content = html

    node.insert_before(new_node)
    node.delete
  end
end

html = ast_for_rouge.to_html

File.write('tmp/commonmark-rouge.html', style+html)

ast_for_coderay = CommonMarker.render_doc(content, :default)

ast_for_coderay.walk do |node|
  if node.type == :code_block
    next if node.fence_info == ''

    source = node.string_content

    html = CodeRay.scan(source, :c).div
    
    new_node = CommonMarker::Node.new(:html)
    new_node.string_content = html

    node.insert_before(new_node)
    node.delete
  end
end

html = ast_for_coderay.to_html

File.write('tmp/commonmark-coderay.html', style+html)
