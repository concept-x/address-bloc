# #8 command to load library named entry.rb via rel filepath
require_relative 'entry'

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
        if name < entry.name #if 'entry.name' (line 15) precedes 'name' (line 12), insert entry and break...
            break
        end
        index+=1 # #10 cont'd: ...otherwise, move to next index and check again
    end
    # #11 insert new entry into 'entries' using index
    entries.insert(index, Entry.new(name, phone_number, email))
end


#assignment: remove_entry method
    def remove_entry(name, phone_number, email)
        index = 0 #var assignment, as in add_entry
        #iterate over entries to find match; use index to remove. 
        entries.each do |entry|
            if name == entry.name #if name to delete == entry.name
                entries.delete_at(index) #index var defined at line 29
            end
            index+=1 
        end
    end
end