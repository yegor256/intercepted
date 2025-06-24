# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require_relative '../lib/intercepted'

# Test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class Testintercepted < Minitest::Test
  def test_simple
    i = intercepted(42) do |o, name, *args, &block|
      r = o.__send__(name, *args, &block)
      puts "#{name}(#{args.join(', ')}) -> #{r}"
      r
    end
    assert_equal(46, i + 4)
    assert_respond_to(i, :+)
  end

  def test_with_named_parameters
    a = nil
    i = intercepted(42) do |_o, name, *args|
      a = { name:, args: }
    end
    i.foo('hey', x: 1)
    assert_equal(:foo, a[:name])
  end
end
