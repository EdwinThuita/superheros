class CreateHeroPowers < ActiveRecord::Migration[7.0]
  def change
    create_table :hero_powers do |t|
      t.string :strength
      t.references :hero, null: false
      t.references :power, null: false

      t.timestamps
    end
  end
end
