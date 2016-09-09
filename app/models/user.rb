class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  enum role: [:normal, :admin]
  after_initialize :default_role, if: :new_record?
  has_secure_password

  def mood
    nausea > happiness ? "sad" : "happy"
  end

  def default_role
    role ||= :normal
  end
end
