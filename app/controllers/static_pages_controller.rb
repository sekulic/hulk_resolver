class StaticPagesController < ApplicationController
    
       
  def index
  if params.has_key?(:code1) && params.has_key?(:text1) && params.has_key?(:code2)
    @position_of_signs = Hash.new
    @final_signs = Array.new
    @all_signs = [*('a'..'z'),*('A'..'Z'),*('0'..'9'),*(':'),*('.'),*('!'),*('-'),*('/'),*(','),*('?')]
    @all_signs.each do |x|
    position = params[:code1].index(x)
    decode_sign = params[:text1].byteslice(position.to_i)
    @position_of_signs[x] = decode_sign
    end
    params[:code2].each_char do |y|
      @position_of_signs.each do |key, value|
        @final_signs.push(value) if y == key
      end
    end
    @result = @final_signs.join()    
    @result2 = @position_of_signs
  else
    @result = "RESULT"
  end 
  end
           
end
  
