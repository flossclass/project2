class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.primary_key :id
      t.integer :user_id
      t.string :query
      t.decimal :price
      t.datetime :date_initiated
      t.datetime :date_found
      t.boolean :done
      t.integer :max

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
