# Easily Typable v1.0.1
[![Gem Version](https://badge.fury.io/rb/easily_typable.svg)](http://badge.fury.io/rb/easily_typable)
[![Build Status](https://api.travis-ci.org/AndyObtiva/easily_typable.svg?branch=master)](https://travis-ci.org/AndyObtiva/easily_typable)
[![Coverage Status](https://coveralls.io/repos/AndyObtiva/easily_typable/badge.svg?branch=master)](https://coveralls.io/r/AndyObtiva/easily_typable?branch=master)
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
```

To avoid the ```model.is_a?(CertainType)``` syntax, a more readable approach
that developers resort to is to add an English-like method that hides the
details of type checking ```model.certain_type?```.

The Rails example above would then become:

```erb
<% if user.admin? %>
  <%= link_to 'Admin', admin_dashboard_path %>
<% end %>
```

Implementing such methods manually gets repetitive after a while, so an easier
way to get these methods automatically is to mixin the ```EasilyTypable```
module.

## Example:

```ruby
require 'easily_typable'

class TypeA
  include EasilyTypable
end

class TypeB < TypeA
end

class TypeC < TypeB
end

## RSpec of Easily Typable
require 'spec_helper'

describe EasilyTypable do
  it "adds type_a? method to TypeA object" do
    expect(TypeA.new.type_a?).to be_truthy
  end
  it "adds type_b? method to TypeA object" do
    expect(TypeA.new.type_b?).to be_falsey
  end
  it "adds type_c? method to TypeA object" do
    expect(TypeA.new.type_c?).to be_falsey
  end
  it "adds type_a? method to TypeB object" do
    expect(TypeB.new.type_a?).to be_truthy
  end
  it "adds type_b? method to TypeB object" do
    expect(TypeB.new.type_b?).to be_truthy
  end
  it "adds type_c? method to TypeB object" do
    expect(TypeB.new.type_c?).to be_falsey
  end
  it "adds type_a? method to TypeC object" do
    expect(TypeC.new.type_a?).to be_truthy
  end
  it "adds type_b? method to TypeC object" do
    expect(TypeC.new.type_b?).to be_truthy
  end
  it "adds type_c? method to TypeC object" do
    expect(TypeC.new.type_c?).to be_truthy
  end
end
```

## Release Notes

 * v1.0.1: Rails model lazy loading now loads EasilyTypable methods automagically
 * v1.0.0: Initial Easily Typable implementation for Ruby
 
## Contributing to Easily Typable

 * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
 * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
 * Fork the project.
 * Start a feature/bugfix branch.
 * Commit and push until you are happy with your contribution.
 * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
 * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

 * Copyright (c) 2012 - 2017 Andy Maleh
 * Copyright (c) 2009 - 2011 Andy Maleh - Obtiva Corp.
 * See LICENSE.txt for further details.
