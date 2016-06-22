require "spec_helper"

describe "Person class" do
  it "should store and return personal information" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    expect(person.dob).to eq Date.new(1990, 01, 01)
    expect(person.first_name).to eq "Joe"
    expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
  end

  it "should have an optional dob" do
    person = Person.new("joe", "bloggs")
    expect(person.dob).to be_nil
  end

  it "should store and return emails in an array" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    expect(person.emails).to eq []
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"

    expect(person.emails).to eq ["joe@foo.com", "joe.bloggs@work.com"]
  end

  it "should store and return phone numbers in an array" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    expect(person.phone_numbers).to eq []
    person.add_phone "07712345678"
    person.add_phone "02012345678"

    expect(person.phone_numbers).to eq ["07712345678", "02012345678"]
  end

  it "should remove the email at the specified position" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"

    person.remove_email(0)

    expect(person.emails).to eq ["joe.bloggs@work.com"]
  end

  it "should return personal information all as one string" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    person.add_email "joe@foo.com"

    person.add_phone "07712345678"

    expect(person.to_s).to eq "Joe Bloggs was born on 1990-01-01.\nTheir email addresses are: [\"joe@foo.com\"].\nTheir phone numbers are: [\"07712345678\"]"
  end

  it "should print out the details of the person, then their emails and phone numbers on seperate lines" do
    person = Person.new("joe", "bloggs", "1 Jan 1990")

    person.add_email "joe@foo.com"

    person.add_phone "07712345678"

    expect {person.print_details}.to output("Joe Bloggs\n---------").to_stdout
  end
end

describe "Family Member class" do
  it "should be able to create a family member" do
    f_member = FamilyMember.new("james", "brown", "5 Aug 1982")

    expect(f_member.dob).to eq Date.new(1982, 8, 05)
    expect(f_member.first_name).to eq "James"
    expect(f_member.surname).to eq "Brown"
    expect(f_member.fullname).to eq "James Brown"
  end

  # it "should be able to set the relationship variable" do
  #   f_member = FamilyMember.new("james", "brown", "5 Aug 1982")
  #
  #   f_member.relationship "Cousin"
  #
  #   expect(f_member.relationship).to eq "Cousin"
  # end
end
