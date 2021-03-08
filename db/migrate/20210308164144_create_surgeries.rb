class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :day_of_week
      t.string :operating_room
    end
  end
end
