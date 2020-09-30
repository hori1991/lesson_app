class AddtelephoneNumberTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :telephoneNumber, :string
  end
end
