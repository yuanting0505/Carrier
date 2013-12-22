class AddFilenameToCard < ActiveRecord::Migration
  def change
  	add_column :cards, :filename1,:string
  	add_column :cards, :filename2,:string
  end
end
