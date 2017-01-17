class User < ActiveRecord::Base
  # after_initialize :set_defaults
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments
  # What this means is , if I'm deleted, take out the parent as well so no errors are found.
  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :bannerimg, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  private

  # def set_defaults
  #   self.discipline = "General Science" if self.discipline.nil?
  # end
end
