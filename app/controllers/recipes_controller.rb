class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])
	end

	def new
		@recipe = Recipe.new
		@ingredients= Ingredient.all
	end

	def create
		Recipe.create(recipe_params)
		redirect_to recipes_path
	end

	def edit
		@recipe = Recipe.find_by(id: params[:id])
		@ingredients = Ingredient.all
		@recipe_ingredients = @recipe.ingredients
	end 

	def update
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.update(recipe_params)
		if params[:recipe][:ingredient_name]
		else
			@recipe.ingredients = []
		end
		redirect_to recipe_path(@recipe)
	end

	def destroy
		@recipe = Recipe.find_by(id: params[:id])
		@recipe.destroy
	end

	private

		def recipe_params
			params.require(:recipe).permit(:name, ingredient_name: [])
		end
end
