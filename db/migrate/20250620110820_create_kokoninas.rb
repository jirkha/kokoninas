class CreateKokoninas < ActiveRecord::Migration[8.0]
  def change
    create_table :kokoninas do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
