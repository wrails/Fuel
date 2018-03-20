class AddDistanceToOffices < ActiveRecord::Migration[5.1]
  def change
    add_column :offices, :distance, :string
  end
end
