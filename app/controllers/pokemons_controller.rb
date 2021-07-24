class PokemonsController < ApplicationController

    
    def index 
           
        @response2 = []
        response = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=10&offset=1')
        response = JSON.parse(response.body)
            response.each do |k, value|
                if k == "results" 
                    value.each do |key, val| 
                        response = RestClient.get(key['url'])
                        response = JSON.parse(response.body)
                        @response2.push(response)
                    end
                end
            end
            # @newarray = (@response2.map { |key, val| [key['weight']  ]})
            # render json: @newarray
        
    end

    private 

    def getPokemon 
        return RestClient.get('https://pokeapi.co/api/v2/pokemon')
    end

   
end
