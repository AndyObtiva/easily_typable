# Easily Typable

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

describe EasilyTypable do
  it "should add type_a? method to TypeA object" do
    expect(TypeA.new.type_a?).to be_truthy
  end
  it "should add type_b? method to TypeB object" do
    expect(TypeB.new.type_b?).to be_truthy
  end
  it "should add type_b? method to TypeA object" do
    expect(TypeA.new.type_b?).to be_falsey
  end
  it "should add type_c? method to TypeC object" do
    expect(TypeC.new.type_c?).to be_truthy
  end
  it "should add type_c? method to TypeA object" do
    expect(TypeA.new.type_c?).to be_falsey
  end
  it "should add type_c? method to TypeB object" do
    expect(TypeB.new.type_c?).to be_falsey
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
