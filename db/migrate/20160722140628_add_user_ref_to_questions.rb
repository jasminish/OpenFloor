class AddUserRefToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :original_author
  end
end
