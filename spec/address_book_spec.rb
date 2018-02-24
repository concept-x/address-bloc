require_relative '../models/address_book'

RSpec.describe AddressBook do
    # #1 create new AddressBook model, assigned to var :book
    let(:book){AddressBook.new}
    
    # #6 created 'helper method' to cut redundancy on entry tests
    def check_entry(entry, expected_name, expected_number, expected_email)
        expect(entry.name).to eq expected_name
        expect(entry.phone_number).to eq expected_number
        expect(entry.email).to eq expected_email
    end
    
    # #2 "describe" and "it" stmts in RSpec
    describe "attributes" do
        it "responds to entries" do
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
        
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')        
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do

            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]
            
            #multiple 'expects' mean if any fail, the whole 'it' test fails
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end #end "adds correct info to entries"
    end #end add_entry
    

    # Test that AddressBook's .import_from_csv() method is working correctly
    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            # #3 call import_from_csv method on book obj, passing "entries.csv" parameter.
            book.import_from_csv("entries.csv")
            # #3 book_size var = array
            book_size = book.entries.size
            
            # Check size of entries in AddressBook
            expect(book_size).to eq 5 #****why isn't this in parentheses like the others?*******
        end #end "imports correct # of entries"
    end #end #import from csv    

    # #4 access 1st entry in AddressBook array
    it "imports the 1st entry" do
        book.import_from_csv("entries.csv")
        #Check the first entry
        entry_one = book.entries[0]
        
        # #5 three "expects" to verify entry info
        check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end #end "imports first entry"

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")    
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end #end 5th entry check
    
end #end RSpec file






 
