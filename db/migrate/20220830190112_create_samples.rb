class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.string :codebar, index: { unique: true }
      t.string :description, null: false
      t.datetime :colected_at, null: false
      t.datetime :born_at
      t.string :gender

      t.timestamps
    end
  end
end
