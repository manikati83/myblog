class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
