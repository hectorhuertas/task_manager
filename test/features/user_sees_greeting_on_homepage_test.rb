require_relative '../test_helper'

class UserSeesGreetingOnHomegape < FeatureTest
  def test_greeting_is_displayed
    visit '/'

    # assert find'(#greeting').has_content?('Welcome to the Task Manager')
    within('#greeting') do
      assert page.has_content?('Welcome to the Task Manager')
    end
  end
end
