require_relative '../models/entry' #corresponding file to test & filepath
# #1(below) standard first line of RSpec test file
RSpec.describe Entry do #this is an RSpec file that tests Entry.
    # #2(below) use 'describe' to give test structure. 
    describe "attributes" do #specifically, our test tests Entry attributes.
        # #3(below) separate each test with 'it' method. Each 'it' is a test. 
        it "responds to name" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            # #4(below) tests end with 'expect' method. If expectations are met, test passes. If not, test fails
            expect(entry).to respond_to(:name)
        end
        
        it "reports its name" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to eq('Ada Lovelace')
        end
        
        it "responds to phone number" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:phone_number)
        end
        
        it "reports its phone_number" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to eq('010.012.1815')
        end
        
        it "responds to email" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to respond_to(:email)
        end
        
        it "reports its email" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(entry).to eq('augusta.king@lovelace.com')
        end
    end    
end
