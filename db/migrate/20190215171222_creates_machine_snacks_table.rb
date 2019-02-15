class CreatesMachineSnacksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.references :snack, forgeign_key: true
      t.references :machine, forgeign_key: true

      t.timestamps
    end
  end
end
