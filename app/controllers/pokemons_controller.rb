class PokemonsController < ApplicationController
    def index
		
	end
	def search
        res  = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:title]}")
        
        
		body = JSON.parse(res.body)
		name = body["name"]
		id = body["id"]
		type = body["types"][0]["type"]["name"]


		response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=aHtC6smrcaWbfwhKHkW5m1pJ0e1Ae4Ke&q=#{params[:title]}&rating=g")
		body1 = JSON.parse(response.body)
		gif_url = body1["data"][0]["url"]

		render json: 
		{
			"id123": id,
			"name": name,
			"type": type,
			"gif": gif_url

		}
	end

end
