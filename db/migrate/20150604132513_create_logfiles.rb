class CreateLogfiles < ActiveRecord::Migration
  def change
    create_table :logfiles do |t|
      t.string :file_name

      t.timestamps null: false
    end
  end
end
