class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.references :user, null: false, foreign_key: true
      t.references :kokonina, null: false, foreign_key: true
      t.timestamps
    end

    add_index :votes, [ :user_id, :kokonina_id ], unique: true
  end
end
