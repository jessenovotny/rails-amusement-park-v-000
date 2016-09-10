class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  # after_initialize :default_role, if: :new_record?
  has_secure_password

  # def admin_value value
  #   binding.pry
  #   value == "1" ? self.admin = true : self.admin = false
  #   binding.pry
  # end

  def mood
    if nausea && happiness
      nausea > happiness ? "sad" : "happy"
    end
  end

  # def default_role
  #   self.admin = false
  # end
end
