require_relative 'controllers/menu_controller'

# #4 Create new MenuController when AddressBloc starts
menu = MenuController.new
# #5 Clear command line
system "clear"
puts "Welcome to AddressBloc!"
# #6 Call main_menu to display menu
menu.main_menu