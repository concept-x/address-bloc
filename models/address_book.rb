# #8 command to load library named entry.rb via rel filepath
require_relative 'entry'
require "csv"

class AddressBook
    attr_reader :entries
    
    def initialize
        @entries = []
    end


def add_entry(name, phone_number, email)
    # #9 (below) create var 'index' to store index
    index = 0
    entries.each do |entry|
        # #10 loop to insert entry name in ABC order
        if name < entry.name #if 'name' precedes 'entry.name, insert entry and break
            break
        end
        index+=1 # #10 cont'd: move to next index and check again
    end
    # #11 insert new entry into 'entries' using index
    entries.insert(index, Entry.new(name, phone_number, email))
    end
    
    # #7 define import_from_csv method. Result of 'parse' is a CSV table obj
    def import_from_csv(file_name)
        #implementation goes here
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # #8 iterate over table rows, create hash for each, then convert to Entry using 'add_entry' method
        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end #end csv.each loop
    end
end