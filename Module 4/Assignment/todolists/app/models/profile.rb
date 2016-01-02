class Profile < ActiveRecord::Base
  belongs_to :user  
  validate :first_name_or_last_name_null_but_not_both
  validates :gender, inclusion: { in: %w(male female) }
  validate :male_cannot_have_first_name_sue

  def first_name_or_last_name_null_but_not_both
  	if (first_name.to_s.empty? && last_name.to_s.empty?)  		
  		errors.add(:first_name, "First name and last name cannot both be null!")
  	end
  end

  def male_cannot_have_first_name_sue
  	if (gender == "male" && first_name == "Sue")  		
  		errors.add(:gender, "Male cannot have first name Sue!")
  	end
  end

  def self.get_all_profiles(min, max)
  	Profile.where("birth_year BETWEEN ? AND ?", min, max).order(birth_year: :asc)
  end

end
