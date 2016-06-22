class FamilyMember < Person
  def initialize(first_name, surname, dob = nil)
    @relationship = nil
    super first_name, surname, dob
  end
end
