class AddUserIdToWorkDays < ActiveRecord::Migration
  def change
    add_column :work_days, :user_id, :integer
  end
end
