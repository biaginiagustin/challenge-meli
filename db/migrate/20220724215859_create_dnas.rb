class CreateDnas < ActiveRecord::Migration[6.1]
  def change
    create_table :dnas, id: :uuid do |t|
      t.jsonb :dna, null: false, default: {}
      t.boolean :mutant, null: false
      
      t.timestamps
    end
  end
end
