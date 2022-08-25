class RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    ## a nice shorthand syntax I got from the walkthru, very clean and efficient
      recipe = @current.user.recipes.create!()
      render json: recipe, status: :created

    
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
    
  end
end
