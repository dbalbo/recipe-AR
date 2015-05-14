require('spec_helper')

describe(Recipe) do
    it('has many ingredients') do
    new_recipe = Recipe.create(name: 'lasagne')
    ingredient1 = Ingredient.create(description: 'noodles', recipe_id: new_recipe.id)
    ingredient2 = Ingredient.create(description: 'sauce', recipe_id: new_recipe.id)
    expect(new_recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end
end