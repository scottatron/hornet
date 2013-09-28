class CreateHornetNodes < ActiveRecord::Migration
  def change
    create_table :hornet_nodes do |t|
      t.string :type
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
