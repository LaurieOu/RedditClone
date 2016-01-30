class AddIndexToSubs < ActiveRecord::Migration
  def change
    add_index :subs, :user_id
  end
end
