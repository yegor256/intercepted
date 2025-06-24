# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# System module.
module Kernel
  def intercepted(origin, &pipe)
    raise 'Block is expected by intercepted()' unless block_given?

    Class.new(BasicObject) do
      define_method(:initialize) { @o = origin }
      define_method(:method_missing) do |name, *args, &block|
        pipe.call(@o, name, *args, &block)
      end
      define_method(:respond_to?) do |name, include_private = false|
        @o.respond_to?(name, include_private)
      end
    end.new
  end
end
