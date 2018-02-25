#!/usr/bin/env ruby

require 'slop'
require_relative 'lib/algo'
require_relative 'lib/store'

opts = Slop.parse do |o|
  o.bool '--show'
  o.bool '--set'
  o.string '-e', '--email'

  o.bool '--best'
  o.string '-n', '--name'
end

if opts.show?
  get_names_by_user(selected_user: opts[:email]) do |user, names|
    p "#{user}: #{names}"
  end
elsif opts.set?
  set_names(user: opts[:email], names: opts.args)
elsif opts.best?
  get_names_by_user() do |user, names|
    best_name, score = best_name(names, opts[:name])
    p "#{user}: #{best_name} (#{score})"
  end
end
