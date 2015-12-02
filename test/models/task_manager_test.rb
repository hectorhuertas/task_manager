require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_tasks
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
     TaskManager.create({ :title       => "another title",
                          :description => "another description"})
    task = TaskManager.find(1)
    task2 = TaskManager.find(2)

    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
    assert_equal "another title", task2.title
    assert_equal "another description", task2.description
    assert_equal 2, task2.id
  end

  def test_it_finds_all_tasks
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
     TaskManager.create({ :title       => "another title",
                          :description => "another description"})
    assert_equal 2, TaskManager.all.size
  end

  def test_it_updates_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
    TaskManager.update(1,{ :title       => "another title",
                         :description => "another description"})

     task = TaskManager.find(1)

     assert_equal "another title", task.title
     assert_equal "another description", task.description
     assert_equal 1, task.id
  end

  def test_it_destroys_a_task
    TaskManager.create({ :title       => "a title",
                         :description => "a description"})
     TaskManager.create({ :title       => "another title",
                          :description => "another description"})

    assert_equal 2,  TaskManager.all.size

    TaskManager.delete(1)
    assert_equal 1,  TaskManager.all.size

    task = TaskManager.all.last
    assert_equal 2, task.id
  end
end
