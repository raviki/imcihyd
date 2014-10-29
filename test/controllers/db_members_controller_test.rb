require 'test_helper'

class DbMembersControllerTest < ActionController::TestCase
  setup do
    @db_member = db_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_member" do
    assert_difference('DbMember.count') do
      post :create, db_member: { Address: @db_member.Address, Certified: @db_member.Certified, City: @db_member.City, DisplayOrder: @db_member.DisplayOrder, Email: @db_member.Email, EmailPrimary: @db_member.EmailPrimary, FirstName: @db_member.FirstName, FullSammary: @db_member.FullSammary, IsAdmin: @db_member.IsAdmin, LandLine: @db_member.LandLine, LastName: @db_member.LastName, MembershipId: @db_member.MembershipId, MembershipType: @db_member.MembershipType, MiddleName: @db_member.MiddleName, MobilePhone: @db_member.MobilePhone, Pin: @db_member.Pin, Prefix: @db_member.Prefix, Secondary: @db_member.Secondary, ShortSummary: @db_member.ShortSummary, Title: @db_member.Title, WebsitePrimary: @db_member.WebsitePrimary, WebsiteSecondary: @db_member.WebsiteSecondary, active: @db_member.active }
    end

    assert_redirected_to db_member_path(assigns(:db_member))
  end

  test "should show db_member" do
    get :show, id: @db_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @db_member
    assert_response :success
  end

  test "should update db_member" do
    patch :update, id: @db_member, db_member: { Address: @db_member.Address, Certified: @db_member.Certified, City: @db_member.City, DisplayOrder: @db_member.DisplayOrder, Email: @db_member.Email, EmailPrimary: @db_member.EmailPrimary, FirstName: @db_member.FirstName, FullSammary: @db_member.FullSammary, IsAdmin: @db_member.IsAdmin, LandLine: @db_member.LandLine, LastName: @db_member.LastName, MembershipId: @db_member.MembershipId, MembershipType: @db_member.MembershipType, MiddleName: @db_member.MiddleName, MobilePhone: @db_member.MobilePhone, Pin: @db_member.Pin, Prefix: @db_member.Prefix, Secondary: @db_member.Secondary, ShortSummary: @db_member.ShortSummary, Title: @db_member.Title, WebsitePrimary: @db_member.WebsitePrimary, WebsiteSecondary: @db_member.WebsiteSecondary, active: @db_member.active }
    assert_redirected_to db_member_path(assigns(:db_member))
  end

  test "should destroy db_member" do
    assert_difference('DbMember.count', -1) do
      delete :destroy, id: @db_member
    end

    assert_redirected_to db_members_path
  end
end
