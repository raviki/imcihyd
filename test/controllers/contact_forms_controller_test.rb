require 'test_helper'

class ContactFormsControllerTest < ActionController::TestCase
  setup do
    @contact_form = contact_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_form" do
    assert_difference('ContactForm.count') do
      post :create, contact_form: { EmailId: @contact_form.EmailId, Message: @contact_form.Message, Name: @contact_form.Name, Phone: @contact_form.Phone, extrfield: @contact_form.extrfield }
    end

    assert_redirected_to contact_form_path(assigns(:contact_form))
  end

  test "should show contact_form" do
    get :show, id: @contact_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_form
    assert_response :success
  end

  test "should update contact_form" do
    patch :update, id: @contact_form, contact_form: { EmailId: @contact_form.EmailId, Message: @contact_form.Message, Name: @contact_form.Name, Phone: @contact_form.Phone, extrfield: @contact_form.extrfield }
    assert_redirected_to contact_form_path(assigns(:contact_form))
  end

  test "should destroy contact_form" do
    assert_difference('ContactForm.count', -1) do
      delete :destroy, id: @contact_form
    end

    assert_redirected_to contact_forms_path
  end
end
