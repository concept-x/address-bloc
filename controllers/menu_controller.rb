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
        end
        
        system "clear"
        puts "End of entries"
    end
    
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
    end
    
    def search_entries
    end
     
    def read_csv
end #I get a syntax error (unexpected end-of-input) when I don't put the extra "end" in...???
    
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
        # #18 nothing right now
            when "n"
        # #19 handle in a future checkpoint; next entry for now
            when "d"
            when "e"
        # #20 return user to main menu
            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end # end entry_submenu
    end #?????? what are we ending here????????
end # end class