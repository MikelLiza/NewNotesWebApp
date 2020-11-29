class AddUsersToNotes < ActiveRecord::Migration[5.2]
  def up
    add_reference :notes, :user, index: true
    Note.reset_column_information
    user = User.first

    Note.all.each do |note|
      note.user_id = user.id
      note.save!
    end

    change_column_null :notes, :user_id, false
    add_foreign_key :notes, :users
  end

  def down
    remove_foreign_key :notes, :users
    remove_reference :notes, :user, index: true
  end
end
