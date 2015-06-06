# -*- coding: utf-8 -*-

def parse_logfile(filename)
    
    scrobbler_log = File.open(filename.to_s, "r:UTF-8")
    
    scrobbler_log.each_line do |log_line|
    	unless log_line.start_with? "#"
    		if (log_line.chomp.split("\t").to_a)[5] == "S"
    			puts "*Skipped track..."
    		else
    			scrobble_data = log_line.chomp.split("\t").to_a
    			puts "*Scrobbling: #{scrobble_data[0]} - #{scrobble_data[1]} - #{scrobble_data[3]} - #{scrobble_data[2]}"
    			#lastfm_handler.track.scrobble(artist: scrobble_data[0], track: scrobble_data[2], timestamp: scrobble_data[6])
    		end
    	end
    end
    
end

