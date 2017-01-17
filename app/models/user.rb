class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :bannerimg, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

   def following?(other_user)
     relationships.find_by(followed_id: other_user.id)
   end

   def follow!(other_user)
     relationships.create!(followed_id: other_user.id)
   end

   def unfollow!(other_user)
     relationships.find_by(followed_id: other_user.id).destroy
   end




  private



  # def set_defaults
  #   self.discipline = "General Science" if self.discipline.nil?
  # end
end
