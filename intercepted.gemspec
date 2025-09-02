# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'

Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.required_ruby_version = '>=3.2'
  s.name = 'intercepted'
  s.version = '0.0.0'
  s.license = 'MIT'
  s.summary = 'Intercepts All Method Calls to a Ruby Object'
  s.description =
    'It takes an existing Ruby object and creates a new one, ' \
    'that accepts all method calls and passes them to the provided block, ' \
    'which can pass them further to the original object.'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'https://github.com/yegor256/intercepted'
  s.files = `git ls-files | grep -v -E '^(test/|\\.|renovate)'`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.metadata['rubygems_mfa_required'] = 'true'
end
