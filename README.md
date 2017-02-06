# Easily Typable

## Introduction:

Often when working with models that belong to an inheritance hierarchy, it is
useful to verify if a particular model is of a certain type to perform some
behavior specific to it. For example, this is needed when the view needs to
handle a special rendering case when encountering a certain type.

The call typically made to accomplish the task is: model.is_a?(CertainType)

Often, to do so in a more readable fashion, developers add a more English-like
method that hides the details of type checking: model.certain_type?

Writing such methods gets repetitive after a while, so an easier way to get
these methods automatically is to mixin the EasilyTypable module.

When mixed into classes in an inheritance hierarchy, each class gets
"certain_type?" methods for its type and all of its subclass types.

## Example:

```ruby
require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/easily_typable'

class TypeA
  include Obtiva::EasilyTypable
end

class TypeB < TypeA
end

class TypeC < TypeB
end

describe "Obtiva::EasilyTypable" do
  it "should add type_a? method to TypeA object" do
    TypeA.new.type_a?.should be_true
  end
  it "should add type_b? method to TypeB object" do
    TypeB.new.type_b?.should be_true
  end
  it "should add type_b? method to TypeA object" do
    TypeA.new.type_b?.should be_false
  end
  it "should add type_c? method to TypeC object" do
    TypeC.new.type_c?.should be_true
  end
  it "should add type_c? method to TypeA object" do
    TypeA.new.type_c?.should be_false
  end
  it "should add type_c? method to TypeB object" do
    TypeB.new.type_c?.should be_false
  end
end
```

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
