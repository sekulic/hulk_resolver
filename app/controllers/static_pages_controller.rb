class StaticPagesController < ApplicationController
  def fibonacci_recusion(n)
  x = [1,1]; n.times  {  x << ( x[-1] + x[-2] ) }
  return x.last
  end      
       
  def index
  if params.has_key?(:number)
    @result = 1 if params[:number].to_i == 1 
    @result = 2 if params[:number].to_i == 2
    x = params[:number].to_i 
    @result = fibonacci_recusion(x) - 1
  else
    @result = ""
  end 
  end
       
  def decoder_backup   
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
    @result = "Result"
  end  
  end
           
end
  
