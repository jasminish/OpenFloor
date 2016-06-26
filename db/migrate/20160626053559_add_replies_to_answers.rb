class AddRepliesToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :parent_answer_id, :integer
  end
end
