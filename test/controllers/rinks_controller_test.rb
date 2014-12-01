require 'test_helper'

class RinksControllerTest < ActionController::TestCase
  setup do
    @rink = rinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rink" do
    assert_difference('Rink.count') do
      post :create, rink: { address: @rink.address, name: @rink.name, ottawa_rinks_ref: @rink.ottawa_rinks_ref, rink_type: @rink.rink_type }
    end

    assert_redirected_to rink_path(assigns(:rink))
  end

  test "should show rink" do
    get :show, id: @rink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rink
    assert_response :success
  end

  test "should update rink" do
    patch :update, id: @rink, rink: { address: @rink.address, name: @rink.name, ottawa_rinks_ref: @rink.ottawa_rinks_ref, rink_type: @rink.rink_type }
    assert_redirected_to rink_path(assigns(:rink))
  end

  test "should destroy rink" do
    assert_difference('Rink.count', -1) do
      delete :destroy, id: @rink
    end

    assert_redirected_to rinks_path
  end
end
