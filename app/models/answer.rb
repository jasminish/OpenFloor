class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :parent_answer, class_name: "Answer"
  belongs_to :original_author, class_name: "User"
  has_many :replies, class_name: "Answer", foreign_key: "parent_answer_id"
end
