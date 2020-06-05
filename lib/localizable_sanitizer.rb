require "localizable_sanitizer/version"

module LocalizableSanitizer
  class Error < StandardError; end
  MATCH_FORMAT = /\"(.*)\"[ ]*=[ ]*\".*\"/
  class Sanitizer
    def sanitize
      files = `find . -name Localizable.strings`.split("\n")

      # Builds a list of keys
      keys = Set.new
      
      files.each do | file | 
        File.open(file).each do | line |
          line.match(MATCH_FORMAT) {|m| 
            keys.add(m.captures.first)
          }
        end
      end

      # Checks that all the files contains all keys
      files.each do |file|
        file_data = File.open(file).read
        keys.each do | key |
          match = file_data.match(/\"#{key}\"/)
          if match.nil?
            STDERR.puts "#{File.absolute_path(file)}:1:1: warning: Missing #{key}\n"
          end
        end
      end
    end
  end
end
