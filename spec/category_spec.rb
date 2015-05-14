require('spec_helper')

describe(Category) do
  it('has many recipes') do
    new_category = Category.create(name: 'ratatouille')
    recipe1 = Recipe.create(name: 'ratatouille')
    recipe2 = Recipe.create(name: 'lasagne')
    new_category.update({:recipe_ids => [recipe1.id(), recipe2.id()]})
    expect(new_category.recipes).to(eq([recipe1, recipe2]))
  end
end
