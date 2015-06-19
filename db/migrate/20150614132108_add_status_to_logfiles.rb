class AddStatusToLogfiles < ActiveRecord::Migration
  def change
    add_column :logfiles, :status, :text
  end
end
