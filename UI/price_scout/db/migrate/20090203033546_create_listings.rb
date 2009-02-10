class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.primary_key :id
      t.integer :request_id
      t.string :title
      t.decimal :price
      t.text :url

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
