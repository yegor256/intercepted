# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# System module.
module Kernel
  def intercepted(origin = nil)
    raise(ArgumentError, 'Block is expected by intercepted()') unless block_given?
    Class.new(BasicObject) do
      define_method(:initialize) { @o = origin }
      define_method(:method_missing) do |mtd, *args, **kw, &block|
        yield(:before, mtd, args)
        r =
          @o.__send__(mtd, *args, **kw) do |*a|
            block&.call(*a)
          end
        yield(:after, mtd, args, r)
        r
      end
      define_method(:respond_to?) do |mtd, include_private = false|
        @o.respond_to?(mtd, include_private)
      end
    end.new
  end
end
