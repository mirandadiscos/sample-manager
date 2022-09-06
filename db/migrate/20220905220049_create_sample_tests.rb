class CreateSampleTests < ActiveRecord::Migration[7.0]
  def change
    create_table :sample_tests do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :code
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
