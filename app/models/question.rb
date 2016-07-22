class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :original_author, class_name: "User"
  validates :title, presence: true,
                    length: {minimum: 5}
end
