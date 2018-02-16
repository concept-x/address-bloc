def greeting
    if ARGV[0]=="Hey"
        ARGV.each do |arg|
            puts "Hey #{arg}!"
        end
    end
    if ARGV[0]=="Yo"
        ARGV.each do |arg|
            puts "Yo #{arg}!"
        end
    end
end
