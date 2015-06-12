class Logfile < ActiveRecord::Base
    mount_uploader :logfile, LogfileUploader
    store_in_background :logfile
end
