class AddDatesToSearches < ActiveRecord::Migration[6.0]
  def change
    add_column :searches, :start_date, :string
    add_column :searches, :end_date, :string
  end
end
