class CreateEmotions < ActiveRecord::Migration[5.0]
  def change
    create_table :emotions do |t|
      t.integer :current_hr
      t.integer :emotion_v
      t.integer :emotion_a
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
