json.array!(@db_members) do |db_member|
  json.extract! db_member, :id, :MembershipId, :MembershipType, :Certified, :Prefix, :FirstName, :MiddleName, :LastName, :Title, :ShortSummary, :FullSammary, :Address, :City, :Pin, :MobilePhone, :LandLine, :EmailPrimary, :Email, :Secondary, :WebsitePrimary, :WebsiteSecondary, :DisplayOrder, :active, :IsAdmin
  json.url db_member_url(db_member, format: :json)
end
