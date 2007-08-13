require File.dirname(__FILE__) + '/../test_helper'
require 'financials_controller'

# Re-raise errors caught by the controller.
class FinancialsController; def rescue_action(e) raise e end; end

class FinancialsControllerTest < Test::Unit::TestCase
  fixtures :fiscal_transactions

  def setup
    @controller = FinancialsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:fiscal_transactions)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:fiscal_transaction)
    assert assigns(:fiscal_transaction).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:fiscal_transaction)
  end

  def test_create
    num_fiscal_transactions = FiscalTransaction.count

    post :create, :fiscal_transaction => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_fiscal_transactions + 1, FiscalTransaction.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:fiscal_transaction)
    assert assigns(:fiscal_transaction).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil FiscalTransaction.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      FiscalTransaction.find(1)
    }
  end
end
