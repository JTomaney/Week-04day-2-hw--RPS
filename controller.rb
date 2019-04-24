require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/rps_model.rb')

also_reload('./models/*')

get '/' do
  erb(:home)
end

get '/:player1choice' do
  @hand1 = params[:player1choice]
  erb(:player2)
end

get '/:hand1/:hand2' do
  @result = RPSGame.check_win(params[:hand1], params[:hand2])
  erb(:result)
end
