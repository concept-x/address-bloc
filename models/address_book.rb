# #8 command to load library named entry.rb via rel filepath
require_relative 'entry'
require "csv"

class AddressBook
    attr_reader :entries
    
    def initialize
        @entries = []
    end
    
    def destroy_all
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
    
  def remove_entry(name, phone_number, email)
      entries.delete_if{|entry| entry.name == name }
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
    end # end import_from_csv
 

    #Search AddressBook for a specific entry by name
    def binary_search(name)
        # #1 save array index first item as 'lower' and last as 'upper'
        lower = 0
        upper = entries.length - 1
        
        # #2 loop while lower index < higher index
        while lower <= upper
            # #3 establish a middle spot and name as mid_name
            mid = (lower + upper)/2
            mid_name = entries[mid].name
            
            # #4 Compare search name with middle index (mid_name)
            if name == mid_name #if that's it, return it
                return entries[mid]
            elsif name < mid_name #if it's before mid_name...
                upper = mid -1 #...set upper to mid-1
            elsif name > mid_name #if it's after mid_name...
                lower = mid +1 #...set lower to mid +1
            end #end if
        end #end 'while' loop
        #***half the list continually until we find what we're looking for***
        
        # #5 **if no match is found, return 'nil'
        return nil
    end #end binary_search method

    def iterative_search(name)
    for i in 0...entries.length
      if entries[i].name == name
        return entries[i]
      end #end 'if'
    end #end 'for' loop
        return nil
    end #end iterative_search
    
end# ***************end address_book file************



