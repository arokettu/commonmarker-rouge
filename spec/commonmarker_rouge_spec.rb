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
    html = CommonMarker::Rouge.render_html(<<-MD, [:DEFAULT], [:UNSAFE])
```haxxor">yay!
somecode
```
MD

    expected = 'language-haxxor&quot;&gt;yay!'
    expect(html).to include(expected) # find only escaped sequence
  end

  it 'supports table extensions' do
    html = CommonMarker::Rouge.render_html(<<-MD, [:DEFAULT], [:DEFAULT], [:table])
| foo | bar |
| --- | --- |
| baz | bim |
MD

    expected = <<-EOF
<table>
<thead>
<tr>
<th>foo</th>
<th>bar</th>
</tr>
</thead>
<tbody>
<tr>
<td>baz</td>
<td>bim</td>
</tr>
</tbody>
</table>
EOF

    expect(html).to(eq(expected))

  end

  it 'does not support table extensions' do
    html = CommonMarker::Rouge.render_html(<<-MD, [:DEFAULT])
| foo | bar |
| --- | --- |
| baz | bim |
    MD

    expected = "<p>| foo | bar |\n| --- | --- |\n| baz | bim |</p>\n"

    expect(html).to(eq(expected))

  end

  it 'omits HTML' do
    html = CommonMarker::Rouge.render_html(<<-MD, [:DEFAULT])
<img src="bla">
MD

    expected = "<!-- raw HTML omitted -->"
    expect(html).to include(expected) # find only escaped sequence
  end

end
