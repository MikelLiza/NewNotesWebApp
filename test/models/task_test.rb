require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @note = notes(:one)
  end

  test 'should not save empty Task' do
    task = Task.new
    task.save
    refute task.valid?
  end

  test 'should save valid task' do
    task = Task.new
    task.title = 'My Task'
    task.note = @note
    task.save
    assert task.valid?
  end
end
