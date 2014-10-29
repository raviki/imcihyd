class CreateAreaOfExpertises < ActiveRecord::Migration
  def change
    create_table :area_of_expertises do |t|
      t.string :Title
      t.string :Filed
      t.string :Domain

      t.timestamps
    end
  end
end
