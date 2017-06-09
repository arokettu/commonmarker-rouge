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

    expected = 'language-haxxor&quot;&gt;yay!'
    expect(html).to include(expected) # find only escaped sequence
  end
end
