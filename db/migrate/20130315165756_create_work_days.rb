class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.decimal :work_hours
      t.date :date

      t.timestamps
    end
  end
end
