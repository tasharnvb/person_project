class Person
  attr_reader :dob, :first_name, :surname

  def initialize(fname, sname, dob = nil)
    @first_name = fname.capitalize
    @surname = sname.capitalize
    @dob = Date.parse(dob) if dob
  end

  def fullname
    "#{@first_name} #{@surname}"
  end
end
