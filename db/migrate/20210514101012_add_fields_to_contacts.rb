class AddFieldsToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :clas, :string
    add_column :contacts, :birthday, :string
    add_column :contacts, :country, :string
    add_column :contacts, :category_class, :string
    add_column :contacts, :category, :string
    add_column :contacts, :sex_clas, :string
    add_column :contacts, :sex, :string
    add_column :contacts, :time, :string
    add_column :contacts, :average, :string
    add_column :contacts, :distance, :string
  end
end
