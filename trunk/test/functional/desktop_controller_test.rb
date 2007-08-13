require File.dirname(__FILE__) + '/../test_helper'
require 'desktop_controller'

# Re-raise errors caught by the controller.
class DesktopController; def rescue_action(e) raise e end; end

class DesktopControllerTest < Test::Unit::TestCase
  def setup
    @controller = DesktopController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
