require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count') do
      post :create, :request => { }
    end

    assert_redirected_to request_path(assigns(:request))
  end

  test "should show request" do
    get :show, :id => requests(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => requests(:one).id
    assert_response :success
  end

  test "should update request" do
    put :update, :id => requests(:one).id, :request => { }
    assert_redirected_to request_path(assigns(:request))
  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete :destroy, :id => requests(:one).id
    end

    assert_redirected_to requests_path
  end
end
