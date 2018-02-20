# #8 command to load library named entry.rb via rel filepath
require_relative 'entry'

class AddressBook
    attr_reader :entries
    
    def initialize
        @entries = []
        puts "I am here"
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
end