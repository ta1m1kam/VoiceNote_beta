class AddImageTonotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :image, :string
  end
end
