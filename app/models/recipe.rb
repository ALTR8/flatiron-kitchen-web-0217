class Recipe < ActiveRecord::Base
	validates :name, presence: true


	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	#def ingredient_ids(ingredient_ids = nil)

	def ingredient_name=(ingredient_name)
   		ingredients = Ingredient.where("name in (?)", ingredient_name)
   		self.ingredients = ingredients
 end

end
