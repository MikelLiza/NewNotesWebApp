require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save empty note" do
    note = Note.new
    note.save
    refute note.valid?
  end

  test 'should save valid note' do
    note = Note.new
    note.title = 'My Note'
    note.description = 'My note is very special.'
    note.save
    assert note.valid?
  end

  test 'should not save duplicate note title' do
    note1 = Note.new
    note1.title = 'My Note'
    note1.description = 'My note is very special.'
    note1.save
    assert note1.valid?

    note2 = Note.new
    note2.title = 'My Note'
    note2.description = 'My note is very special.'
    note2.save
    refute note2.valid?
  end
end
