# encoding: utf-8

class LogfileUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  storage :file

  process :process_logfile

  def process_logfile
    scrobbler_log = File.open(current_path, "r:UTF-8")
   
    scrobbler_log.each_line do |log_line|
      unless log_line.start_with? "#"
        if (log_line.chomp.split("\t").to_a)[5] == "S"
          Rails.logger.debug "* Skipped track..."
        else
          scrobble_data = log_line.chomp.split("\t").to_a
          Rails.logger.debug "* Scrobbling: #{scrobble_data[0]} - #{scrobble_data[1]} - #{scrobble_data[3]} - #{scrobble_data[2]}"
          self.model.update!(status: "* Scrobbling: #{scrobble_data[0]} - #{scrobble_data[1]} - #{scrobble_data[3]} - #{scrobble_data[2]}")
          #lastfm_handler.track.scrobble(artist: scrobble_data[0], track: scrobble_data[2], timestamp: scrobble_data[6])
        end
      end
    end

    # delete tmp file
    File.delete current_path
  end

  def store_dir
    "~/workspace/uploads/#{model.id}"
  end

  def extension_white_list
     %w(log)
  end
end