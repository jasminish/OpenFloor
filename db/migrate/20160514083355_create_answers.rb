class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :author
      t.text :body
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
