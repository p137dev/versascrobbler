class Logfile < ActiveRecord::Base
    mount_uploader :file_name, LogfileUploader
end
