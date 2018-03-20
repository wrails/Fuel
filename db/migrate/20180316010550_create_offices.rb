class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
