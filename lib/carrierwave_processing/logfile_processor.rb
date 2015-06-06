require 'lastfm_parser.rb'

module CarrierWave
  module LogfileProcessor
    extend ActiveSupport::Concern
    
    module ClassMethods
        
      def process_logfile
        process :process_logfile
      end
      
    end

    def process_logfile
      # move upload to local cache
      cache_stored_file! if !cached?

      directory = File.dirname( current_path )

      # move upload to tmp file - encoding result will be saved to
      # original file name
      tmp_path   = File.join( directory, "tmpfile" )
      File.rename current_path, tmp_path

      # parse
      parse_logfile(tmp_path)

      # delete tmp file
      File.delete tmp_path
    end

    private
      def prepare!
        cache_stored_file! if !cached?
      end
  end
end
