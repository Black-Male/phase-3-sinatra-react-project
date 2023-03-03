class CreateTheTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :thetasks do |t|
      t.string :task_details #contains the information on what the task is about
      t.datetime :due_date #when task should be done by,
      t.boolean :done
      t.timestamps  #shows when task was created
    end
  end
end
