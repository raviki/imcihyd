require 'test_helper'

class AreaOfExpertisesControllerTest < ActionController::TestCase
  setup do
    @area_of_expertise = area_of_expertises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_of_expertises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_of_expertise" do
    assert_difference('AreaOfExpertise.count') do
      post :create, area_of_expertise: { Domain: @area_of_expertise.Domain, Filed: @area_of_expertise.Filed, Title: @area_of_expertise.Title }
    end

    assert_redirected_to area_of_expertise_path(assigns(:area_of_expertise))
  end

  test "should show area_of_expertise" do
    get :show, id: @area_of_expertise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_of_expertise
    assert_response :success
  end

  test "should update area_of_expertise" do
    patch :update, id: @area_of_expertise, area_of_expertise: { Domain: @area_of_expertise.Domain, Filed: @area_of_expertise.Filed, Title: @area_of_expertise.Title }
    assert_redirected_to area_of_expertise_path(assigns(:area_of_expertise))
  end

  test "should destroy area_of_expertise" do
    assert_difference('AreaOfExpertise.count', -1) do
      delete :destroy, id: @area_of_expertise
    end

    assert_redirected_to area_of_expertises_path
  end
end
