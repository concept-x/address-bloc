# #1 include address_book
require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu 
        # #2 display main menu options in command line
        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - Exit"
        print "Enter your selection: "
        
        # #3 grab user input with 'gets'
        selection = gets.to_i
        
        # #7 "case" = statement operator
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
                puts "Good-bye!"
            # #8 terminate program w/o error (0)
                exit(0)
            # #9 to catch invalid user input and prompt user to retry
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end #end case
    end #end main_menu
    
    # #10 stub the rest of the methods called in main_menu
    def view_all_entries
        # #14 iterate thru entries with "each"
        address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
        # #15 display entry_submenu for each entry
            entry_submenu(entry)
        end #end "each" loop
        
        system "clear"
        puts "End of entries"
    end #end view_all_entries
    
    def create_entry
        # #11 clear screen before displaying 'create entry' prompts
        system "clear"
        puts "New AddressBloc Entry"
        # #12 prompt user for each entry attribute
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp
        
        # #13 add new entry using method in address_book.rb
        address_book.add_entry(name, phone_number, email)
        
        system "clear"
        puts "New entry created" 
    end #end create_entry
    
    def search_entries
        # #9 store user input in 'name' var
        print "Search by name: "
        name = gets.chomp
        # #10 search
        match = address_book.binary_search(name)
        system "clear"
        # #11 check if 'search' returned match; allow user submenu options on match
        if match
            puts match.to_s
            search_submenu(search)
        else
            puts "No match found for #{name}"
        end #end 'if'
    end #end search_entries
    
    def search_submenu(entry)
        # #12 print entry submenu
        puts "\nd - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        # #13 save user input to selection
        selection = gets.chomp
        
       # #14 
    case selection
       when "d"
         system "clear"
         delete_entry(entry)
         main_menu
       when "e"
         edit_entry(entry)
         system "clear"
         main_menu
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         puts entry.to_s
         search_submenu(entry)
    end #end case selection
    end #end search_submenu
     
    def read_csv   
    # #1 prompt for CSV file name
    print "Enter CSV file to import: "
    file_name = gets.chomp
    
    # #2 if file name = empty, return user to main menu
    if file_name.empty?
        system "clear"
        puts "No CSV file read"
        main_menu
    end
        
    # #3 import from CSV, print # entries. 'begin' & 'rescue' block handle exceptions & keep prog from crashing.
    begin 
        entry_count = address_book.import_from_csv(file_name).count
        system "clear"
        puts "#{entry_count} new entries added from #{file_name}"
    rescue
        puts "#{file_name} is not a valid CSV file; please enter the name of a valid CSV file"
        read_csv
    end #this may be an extra 'end'
    end #end read_csv
    
    #this may need to go inside the extra "end" above
    def entry_submenu(entry)
        # #16 display submenu options
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"
        
        # #17 chomp removes trailing whitespace from returned string
        selection = gets.chomp
        
        case selection
            when "n"
            when "d"
                delete_entry(entry)
            when "e"
                edit_entry(entry)
                entry_submenu(entry)
        # #20 return user to main menu
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
            end # end case
    end #entry_submenu
    
   def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
   end #end delete_entry
    
   def edit_entry(entry)
     # #4 gather user input & updates values
     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     phone_number = gets.chomp
     print "Updated email: "
     email = gets.chomp
     # #5 update entries only if user input values were valid
     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"
     # #6 print newly updated entry
     puts "Updated entry: "
     puts entry
   end
 
 
end # end class