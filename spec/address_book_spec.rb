require_relative '../models/address_book'

RSpec.describe AddressBook do
    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end
        
        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end
        
        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
        
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            
            expect(book.entries.size).to eq(1)
        end
        
        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') #book has to include entry to remove one
            new_entry = book.entries[0]
            
            #multiple 'expects' mean if any fail, the whole 'it' test fails
            #these are all properties of the entry (line 32)
            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end
    end
    
    #assignment: remove_entry
    describe "#remove_entry" do
        it "removes only one entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')#add because you need >= 1 entry
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
                        
            #evaluate entries.size before and after removal to ensure only one entry was deleted? Yes, but unnecessary in this case due to line 51
            expect(book.entries.size).to eq(0)#since we only put in one entry, after we remove one, the total should be zero.
        end
    end
end
