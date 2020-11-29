require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @task = tasks(:one)
    @note = notes(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end


  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { note_id: @task.note_id, title: @task.title } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { note_id: @task.note_id, title: @task.title } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
