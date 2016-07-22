class AddUserRefToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :original_author
  end
end
