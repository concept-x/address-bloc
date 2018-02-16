=begin
def greeting
    if ARGV[0]=="Hey"#if first array element == "Hey"...
        ARGV.each do |arg|#...take the other arguments as names, and...
            puts "Hey #{arg}!"#...print this greeting for every name.
        end
    end
    if ARGV[0]=="Yo"
        ARGV.drop(1)#does this need its own 'end' statement?
        ARGV.each do |arg|
            puts "Yo #{arg}!"
        end
    end
end
=end

greeting = ARGV.shift

ARGV.each do |name| #for each element |name| in the array, iterate over...
  puts "#{greeting} #{name}!"#...passing in greeting (arg1) and names(args 2-end)
end

#simpler than hard-coding greetings as per first attempt
#Very close on the array method. .drop won't work unless we're hard-coding greetings, so .shift is better.
#test: run ruby greeting.rb Yo Smitty Leo James or
#ruby greeting.rb Sup Snoop Dre Cube