require_relative 'lib/highmarker'

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

html = CommonMarker.render_html(content, :default)

File.write('tmp/commonmark-vanilla.html', style+html)

html = HighMarker::Rouge.render_doc(content, :default).to_html

File.write('tmp/commonmark-rouge.html', style+html)

require 'coderay'

html = HighMarker::CodeRay.render_html(content, :default)

File.write('tmp/commonmark-coderay.html', style+html)
