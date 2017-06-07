require 'spec_helper'

describe CommonMarker::Rouge do
  it 'does something useful' do
    html = CommonMarker::Rouge.render_html(<<-MD)
# Test

```
somecode
```

```ruby
puts 'highlight as ruby'
```
MD

    expect(html).to_not eq('')
  end

  it 'escapes language markup' do
    html = CommonMarker::Rouge.render_html(<<-MD)
```haxxor">yay!
somecode
```
MD

    expected = <<-HTML
<div class="highlighter-rouge language-haxxor&quot;&gt;yay!"><pre class=\"highlight\"><code>somecode
</code></pre>
</div>
HTML
    expect(html).to eq(expected)
  end
end
