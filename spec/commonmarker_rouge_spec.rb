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
end
