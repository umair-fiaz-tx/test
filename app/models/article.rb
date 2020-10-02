class Article < ApplicationRecord
  paginates_per 10
  validates :title, presence: true,
            length: { minimum: 5 }

  validates :text,  presence:  true,
            length: {minimum: 5 }


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user


  has_many :comments

end
