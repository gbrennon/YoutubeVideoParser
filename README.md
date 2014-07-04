YoutubeVideoParser
==================

Ruby script that query youtube about a list of 'N' videos from a user 'U'

This implementation is based on Google Youtube API V2 because it doesn't need
any authentication on youtube server.

Soon I'll update this to Youtube API V3

Example, parse Confreaks channel and return the last 10:

```ruby
require_relative 'youtubevideoparser'

y = YoutubeVideoParser.new('Confreaks', 10)
y.listvideos
```

This will return an Hash of (title => url)
