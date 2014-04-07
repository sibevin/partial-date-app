class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.date :release_date
      t.integer :date_mask, :limit => 3, :default => 0
      t.timestamps
    end
  end
end
