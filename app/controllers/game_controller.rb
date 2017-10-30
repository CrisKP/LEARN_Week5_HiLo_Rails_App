class GameController < ApplicationController

  def try

    cookies[:secret_number] = (rand() * 100).to_i if cookies[:secret_number].nil?
    cookies[:counter] = 1 unless cookies[:counter] != nil

    if cookies[:counter].to_i+1 < 3
      if params[:guess].to_i < cookies[:secret_number].to_i
        @result = "is too low!"
      elsif params[:guess].to_i > cookies[:secret_number].to_i
        @result = "is too high!!"
      end
      cookies[:counter] = cookies[:counter].to_i + 1
      if cookies[:secret_number].to_i == params[:guess].to_i
        @result = "is the correct number. You got it! You win!"
        cookies[:counter] = 0
        cookies[:secret_number] = (rand() * 100).to_i
      end
    else
      @result = "is incorrect. You lose! The secret number has been reset."
      cookies[:counter] = 0
      cookies[:secret_number] = (rand() * 100).to_i
    end

    render "try.html.erb"
  end
end
