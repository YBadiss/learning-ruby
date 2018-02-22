#!/usr/bin/env ruby

require 'slop'
require_relative 'lib/algo'
require_relative 'lib/store'

opts = Slop.parse do |o|
  o.bool '--show'
  o.bool '--set'
  o.string '-e', '--email'

  o.bool '--comp'
  o.string '-n', '--name'
end

if opts.show?
  get_names(user: opts[:email]).each do |name|
    p name
  end
elsif opts.set?
  set_names(user: opts[:email], names: opts.args)
elsif opts.comp?
  get_names_by_user().each do |user, names|
    p "#{user}: #{names.map { |name| distance(name, opts[:name]) }.min}"
  end
end
