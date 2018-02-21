#!/usr/bin/env ruby

require 'slop'
require_relative 'lib/store'

opts = Slop.parse do |o|
  o.string '-e', '--email', required: true
  o.bool '--show'
end

if opts.show?
  get_names(user: opts[:email]).each { |name|
    p name
  }
else
  store_names(user: opts[:email], names: opts.args)
end
