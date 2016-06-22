class Person
  attr_reader :dob, :first_name, :surname, :emails, :phone_numbers

  def initialize(fname, sname, dob = nil)
    @first_name = fname.capitalize
    @surname = sname.capitalize
    @dob = Date.parse(dob) if dob
    @emails = []
    @phone_numbers = []
  end

  def fullname
    "#{@first_name} #{@surname}"
  end

  def add_email(address)
    @emails << address
  end

  def add_phone(number)
    @phone_numbers << number
  end

  def remove_email(position)
    @emails.delete_at position
  end
end
