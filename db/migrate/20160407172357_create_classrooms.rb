class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student, index: true
      t.references :course, index: true
      t.datetime :entry_at

      t.timestamps
    end
  end
end
