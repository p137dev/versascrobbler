class AddLogfileTmpToLogfiles < ActiveRecord::Migration
  def change
    add_column :logfiles, :logfile_tmp, :string
  end
end
