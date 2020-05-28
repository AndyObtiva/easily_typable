require 'spec_helper'

class TypeA
  include EasilyTypable
end

class TypeB < TypeA
end

class TypeC < TypeB
end

class TypeB < TypeA
  class TypeD < TypeB
  end
end

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
  it "adds type_d? method to TypeA object" do
    expect(TypeA.new.type_d?).to be_falsey
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
  it "adds type_d? method to TypeB object" do
    expect(TypeB.new.type_d?).to be_falsey
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
  it "adds type_d? method to TypeC object" do
    expect(TypeC.new.type_d?).to be_falsey
  end
  it "adds type_a? method to TypeD object" do
    expect(TypeB::TypeD.new.type_a?).to be_truthy
  end
  it "adds type_b? method to TypeD object" do
    expect(TypeB::TypeD.new.type_b?).to be_truthy
  end
  it "adds type_c? method to TypeD object" do
    expect(TypeB::TypeD.new.type_c?).to be_falsey
  end
  it "adds type_d? method to TypeD object" do
    expect(TypeB::TypeD.new.type_d?).to be_truthy
  end
end
