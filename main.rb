require 'trello'
require 'pry'


def puts_todos
  configure
  cards = get_cards
  lists = get_lists


  puts '--------------------------------'
  lists.each do |list|
      puts list.name

      list.cards.each do |card|
        puts card.name
        puts ""
      end
  end


  puts '--------------------------------'
end

def configure
  Trello.configure do |config|
      config.developer_public_key = '1c85c37b60bcaef240a83319c5c8ccd9' # The "key" from step 1
      config.member_token = 'cfbf3dc9e47ee75e9334fdf1f7ab76796f59b6e5380b469ed9a2a1f561288555' # The token from step 2.
    end
end

# def get_cards
#   member = Trello::Member.find('user48233696')
#   boards = member.boards
#   board = boards.find{|board| board.name == 'TODO'}
#   list = board.lists[0]
#   cards  = list.cards
#   cards
# end

def get_lists
  member = Trello::Member.find('user48233696')
  boards = member.boards
  board = boards.find{|board| board.name == 'TODO'}
  lists = board.lists
  lists
end



puts_todos
