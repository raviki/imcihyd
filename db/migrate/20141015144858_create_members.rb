class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :MembershipId
      t.string :MembershipType
      t.boolean :Certified
      t.string :Prefix
      t.string :FirstName
      t.string :MiddleName
      t.string :LastName
      t.string :Title
      t.string :ShortSummary
      t.string :FullSammary
      t.string :Address
      t.string :City
      t.decimal :Pin
      t.decimal :MobilePhone
      t.string :LandLine
      t.string :EmailPrimary
      t.string :Email
      t.string :Secondary
      t.string :WebsitePrimary
      t.string :WebsiteSecondary
      t.float :DisplayOrder
      t.boolean :active
      t.boolean :IsAdmin
    end
  end
end
