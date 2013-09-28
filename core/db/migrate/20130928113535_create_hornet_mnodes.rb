class CreateHornetMnodes < ActiveRecord::Migration
  def change
    create_table :hornet_mnodes do |t|
      t.string :type
      t.string :name
      t.string :file_uid
      t.string :file_name

      t.timestamps
    end
  end
end
