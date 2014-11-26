class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :Name
      t.string :Phone
      t.string :EmailId
      t.string :Message
      t.string :extrfield

      t.timestamps
    end
  end
end
