require_relative '../test_helper'

class UserCreatesATask < FeatureTest

  def create_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
  end

  def test_task_is_created
    visit '/'
    click_link 'New Task'
    fill_in('task[title]', :with => 'Writing')
    fill_in('task[description]', :with => 'word after word')
    click_button 'Submit'

    assert_equal '/tasks', current_path
    within('#1') do
      assert page.has_content?('Writing')
    end
  end

  def test_task_is_updated
    create_task

    visit '/tasks'
    find('#1').click_link('Edit')
    fill_in('task[title]', :with => 'Writing')
    fill_in('task[description]', :with => 'word after word')
    click_button 'Submit'

    assert_equal '/tasks/1', current_path
    assert page.has_content?('Writing')
  end

  def test_it_deletes_task
    create_task

    visit '/tasks'
    find('#1').click_button 'Delete'

    refute page.has_css?('#1')
  end
end
