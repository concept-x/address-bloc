require_relative '../models/entry' #corresponding file to test & filepath
# #1(below) standard first line of RSpec test file
RSpec.describe Entry do #this is an RSpec file that tests Entry.
    # #2(below) use 'describe' to give test structure. 
    describe "attributes" do #specifically, our test tests Entry attributes.
        let(:entry){Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}#allows us to define entry once instead of in every test
        # #3(below) separate each test with 'it' method. Each 'it' is a test. 
        it "responds to name" do
            # #4(below) tests end with 'expect' method. If expectations are met, test passes. If not, test fails
            expect(entry).to respond_to(:name)
        end
        
        it "reports its name" do
            expect(entry.name).to eq('Ada Lovelace')
        end
        
        it "responds to phone number" do
            expect(entry).to respond_to(:phone_number)
        end
        
        it "reports its phone_number" do
            expect(entry.phone_number).to eq('010.012.1815')
        end
        
        it "responds to email" do
            expect(entry).to respond_to(:email)
        end
        
        it "reports its email" do
            expect(entry.email).to eq('augusta.king@lovelace.com')
        end
    end   
    
    # #5 New block to separate to_s from initializer tests
    describe "#to_s" do # # indicates to_s is an instance method
        it "prints entry as a string" do
            entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
    # #6 check that to_s returns a string = to expected_string
            expect(entry.to_s).to eq(expected_string)
        end
    end 
end
