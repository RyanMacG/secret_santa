class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string  :name
      t.string  :email
      t.integer :group_id
      t.integer :partner_id
      t.timestamps
    end
    add_index :participants, :group_id
    add_index :participants, :partner_id
  end
end
