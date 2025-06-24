# Intercepts All Method Calls to a Ruby Object

[![DevOps By Rultor.com](https://www.rultor.com/b/yegor256/intercepted)](https://www.rultor.com/p/yegor256/intercepted)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/intercepted/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/intercepted/actions/workflows/rake.yml)
[![PDD status](https://www.0pdd.com/svg?name=yegor256/intercepted)](https://www.0pdd.com/p?name=yegor256/intercepted)
[![Gem Version](https://badge.fury.io/rb/intercepted.svg)](https://badge.fury.io/rb/intercepted)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/intercepted.svg)](https://codecov.io/github/yegor256/intercepted?branch=master)
[![Yard Docs](https://img.shields.io/badge/yard-docs-blue.svg)](https://rubydoc.info/github/yegor256/intercepted/master/frames)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/intercepted)](https://hitsofcode.com/view/github/yegor256/intercepted)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/intercepted/blob/master/LICENSE.txt)

It decorates an existing Ruby object and intercepts all calls
to all its methods:

```ruby
require 'intercepted'
i = intercepted(42) do |o, name, *args, &block|
  r = o.__send__(name, *args, &block)
  puts "#{name}(#{args.join(', ')}) -> #{r}"
  r
end
puts i + 4
```

Prints:

```text

```

That's it.

## How to contribute

Read
[these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have
[Ruby](https://www.ruby-lang.org/en/) 3.0+ and
[Bundler](https://bundler.io/) installed. Then run:

```bash
bundle update
bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.
