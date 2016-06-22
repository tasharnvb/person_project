require "spec_helper"

describe "Person class" do
  it "should store and return personal information" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    expect(person.dob).to eq Date.new(1990,01,01)
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end

  it "should have an optional dob" do
    person = Person.new("joe", "bloggs")
    expect(person.dob).to be_nil
  end
end
