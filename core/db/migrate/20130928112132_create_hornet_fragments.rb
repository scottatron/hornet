class CreateHornetFragments < ActiveRecord::Migration
  def change
    create_table :hornet_fragments do |t|
      t.string :type
      t.references :node
      t.references :mnode
      t.string :key
      t.text :value

      t.timestamps
    end
    add_index :hornet_fragments, :node_id
    add_index :hornet_fragments, :mnode_id
  end
end
