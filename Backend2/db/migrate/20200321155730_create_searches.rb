class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :hashtags

      t.timestamps
    end
  end
end
