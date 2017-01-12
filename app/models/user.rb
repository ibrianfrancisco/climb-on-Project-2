class User < ActiveRecord::Base
  # after_initialize :set_defaults
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  # What this means is , if I'm deleted, take out the parent as well so no errors are found.

  private

  # def set_defaults
  #   self.discipline = "General Science" if self.discipline.nil?
  # end
end
