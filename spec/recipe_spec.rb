require('spec_helper')

describe(Recipe) do
    it('has many ingredients') do
    new_recipe = Recipe.create(name: 'lasagne')
    ingredient1 = Ingredient.create(description: 'noodles', recipe_id: new_recipe.id)
    ingredient2 = Ingredient.create(description: 'sauce', recipe_id: new_recipe.id)
    expect(new_recipe.ingredients()).to(eq([ingredient1, ingredient2]))
  end


it('rates a recipe') do
    test_recipe1 = Recipe.create(name:'lasagne', rating: 3)
    test_recipe2 = Recipe.create(name:'ratatouille', rating: 4)
    test_recipe3 = Recipe.create(name: 'stir-fry', rating: 5)
    expect(Recipe.all()).to(eq([test_recipe1, test_recipe2, test_recipe3]))
  end
end
