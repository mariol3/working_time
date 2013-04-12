class AddDetailsToWorkDay < ActiveRecord::Migration
  def change
    add_column :work_days, :details, :string
  end
end
