class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :destination
      t.string :content
      t.timestamps
    end
  end
end
