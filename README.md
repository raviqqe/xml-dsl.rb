# xml-dsl

[![Build Status](https://travis-ci.org/raviqqe/xml-dsl.rb.svg?branch=master)](https://travis-ci.org/raviqqe/xml-dsl.rb)
[![License](https://img.shields.io/badge/license-unlicense-lightgray.svg)](https://unlicense.org)

Dockerfile DSL in Ruby

## Installation

```
$ gem install xml-dsl
```

## Usage

Code:

```ruby
require 'xml-dsl'

file = xml do
  html do
    head do
    end

    body do
    end
  end
end

puts file
```

Output:

```xml
TODO
```

For more examples, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
