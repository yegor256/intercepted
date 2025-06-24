# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

# System module.
module Kernel
  def intercepted(origin = nil)
    raise 'Block is expected by intercepted()' unless block_given?

    Class.new(BasicObject) do
      define_method(:initialize) { @o = origin }
      define_method(:method_missing) do |mtd, *args, &block|
        yield(:before, mtd, args)
        params = @o.method(mtd).parameters
        reqs = params.count { |p| p[0] == :req }
        maybe = %i[key keyreq]
        r =
          if params.any? { |p| maybe.include?(p[0]) } && args.size > reqs
            @o.__send__(mtd, *args[0..-2], **args.last) do |*a|
              block&.call(*a)
            end
          else
            @o.__send__(mtd, *args) do |*a|
              block&.call(*a)
            end
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
