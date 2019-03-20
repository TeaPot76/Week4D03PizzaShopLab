require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

get '/pizza_orders' do #order
  @orders = PizzaOrder.all()
  erb(:index)
end

get '/pizza_orders/new' do #neworder
  erb (:new)
end

get '/pizza_orders/:id' do #show
  @order =  PizzaOrder.find(params[:id])
  erb (:show)
end


post '/pizza_orders' do #create
  @order = PizzaOrder.new(params)
  @order.save
  erb (:create)
end
#
post '/pizza_orders/:id/delete' do #delete
  @order = PizzaOrder.new(params)
  @order.delete
  erb (:delete)
end

get '/pizza_orders/:id/edit' do #delete
  @order = PizzaOrder.find(params[:id])
  erb (:edit)
end

post '/pizza_orders/:id/update' do #updated
  @order = PizzaOrder.new(params)
  @order.update()
  erb (:update)
end
