# EasilyTypable v1.0.2
[![Gem Version](https://badge.fury.io/rb/easily_typable.svg)](http://badge.fury.io/rb/easily_typable)
[![Build Status](https://api.travis-ci.org/AndyObtiva/easily_typable.svg?branch=master)](https://travis-ci.org/AndyObtiva/easily_typable)
[![Test Coverage](https://api.codeclimate.com/v1/badges/61a688078896badc104f/test_coverage)](https://codeclimate.com/github/AndyObtiva/easily_typable/test_coverage)
[![Code Climate](https://codeclimate.com/github/AndyObtiva/easily_typable.svg)](https://codeclimate.com/github/AndyObtiva/easily_typable)

## Introduction:

Although polymorphism is a recommended standard in Object-Oriented programming
for invoking varied behavior in an inheritance hierarchy, sometimes it is still
useful to verify if a particular model belongs to a certain type when the
behavior concerned does not belong to the model and is too small to require a
Design Pattern like Strategy.

A common example in Rails is checking user roles before rendering certain
parts of the view:

```erb
<% if user.is_a?(Admin) %>
  <%= link_to 'Admin', admin_dashboard_path %>
<% end %>
<% if user.is_a?(Customer) %>
  <%= link_to 'Customer Profile', customer_profile_path %>
<% end %>
```

To avoid the `model.is_a?(Admin)` syntax, a more readable approach
that developers resort to is to add an English-like DSL method that hides the
details of Object-Oriented type checking: `model.admin?`.

The Rails example above would then become:

```erb
<% if user.admin? %>
  <%= link_to 'Admin', admin_dashboard_path %>
<% end %>
<% if user.customer? %>
  <%= link_to 'Customer Profile', customer_profile_path %>
<% end %>
```

Implementing such methods manually gets repetitive and error-prone, so an easier
way to get these methods automatically is to mixin the ```EasilyTypable```
module.

## Example:

```ruby
require 'easily_typable' # in IRB at cloned project directory, call this instead: require './lib/easily_typable' 

class Vehicle
  include EasilyTypable
end

class Car < Vehicle
end

class Truck < Vehicle
end

class Van < Vehicle
end


puts Car.new.vehicle? # prints true
puts Car.new.car? # prints true
puts Car.new.truck? # prints false
puts Car.new.van? # prints false

puts Truck.new.vehicle? # prints true
puts Truck.new.car? # prints false
puts Truck.new.truck? # prints true
puts Truck.new.van? # prints false

puts Van.new.vehicle? # prints true
puts Van.new.car? # prints false
puts Van.new.truck? # prints false
puts Van.new.van? # prints true
```

## Release Notes

 * v1.0.2: Support namespaced subclasses
 * v1.0.1: Rails model lazy loading now loads EasilyTypable methods automagically
 * v1.0.0: Initial EasilyTypable implementation for Ruby
 
## Contributing to EasilyTypable

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
 * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
 * Fork the project.
 * Start a feature/bugfix branch.
 * Commit and push until you are happy with your contribution.
 * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
 * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

 * Copyright (c) 2009-2020 Andy Maleh
 * See LICENSE.txt for further details.
