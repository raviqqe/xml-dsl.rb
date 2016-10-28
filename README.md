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
  from :ubuntu
  run 'sudo apt install nginx'
  add 'nginx.conf', '/etc/nginx.conf'
  cmd [:service, :nginx, :start]
end

puts file
```

Output:

```xml
FROM ubuntu
RUN sudo apt install nginx
ADD nginx.conf /etc/nginx.conf
CMD ["service", "nginx", "start"]
```

For more examples, see [examples](examples) directory.

## License

[The Unlicense](https://unlicense.org)
