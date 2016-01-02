lass AddUserRefToTodolists < ActiveRecord::Migration
  def change
    add_reference :todolists, :user, index: true, foreign_key: true
  end
end
