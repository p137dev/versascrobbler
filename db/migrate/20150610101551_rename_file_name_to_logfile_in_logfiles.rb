class RenameFileNameToLogfileInLogfiles < ActiveRecord::Migration
  def change
    rename_column :logfiles, :file_name, :logfile
  end
end
