# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require_relative '../lib/intercepted'
require_relative 'test__helper'

# Test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2025 Yegor Bugayenko
# License:: MIT
class Testintercepted < Minitest::Test
  def test_simple
    i = intercepted(42) do |e, m, args, r|
      puts "#{m}(#{args.join(', ')}) -> #{r}" if e == :after
    end
    assert_equal(46, i + 4)
    assert_respond_to(i, :+)
  end

  def test_only_passes_named_arguments
    o = Class.new do
      def foo(bar: 0)
        bar + yield
      end
    end.new
    i = intercepted(o) do |_e, _m, _args, _r|
      'none'
    end
    assert_equal(11, i.foo(bar: 8) { 3 })
  end

  def test_passes_named_arguments_through
    o = Class.new do
      def foo(one, bar: 0)
        one + bar + yield
      end
    end.new
    i = intercepted(o) do |_e, _m, _args, _r|
      true
    end
    assert_equal(21, i.foo(7, bar: 8) { 6 })
  end

  def test_passes_stared_args
    o = Class.new do
      def foo(*_args)
        yield
      end
    end.new
    i = intercepted(o) do |_e, _m, _args, _r|
      true
    end
    assert_equal(77, i.foo(8, 8, 8) { 77 })
  end
end
