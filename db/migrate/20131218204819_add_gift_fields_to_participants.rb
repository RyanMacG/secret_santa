class AddGiftFieldsToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :matched, :boolean, default: false, null: false
    add_column :participants, :giftee_id, :integer
  end
end
