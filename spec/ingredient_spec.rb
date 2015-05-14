require('spec_helper')

describe(Ingredient) do

  it('has one recipe') do
  new_recipe = Recipe.create(name:'lasagne')
  new_ingredient = Ingredient.create(description: 'pasta')
  new_recipe.ingredients.push(new_ingredient)
  expect(new_ingredient.recipe_id).to(eq(new_recipe.id))
  end
end
