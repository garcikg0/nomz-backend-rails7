class CreateKitchens < ActiveRecord::Migration[7.0]
  def change
    create_table :kitchens do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
