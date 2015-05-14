require('bundler/setup')
Bundler.require(:default, :development)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end


get('/recipes') do
  @recipes = Recipe.all
  erb(:recipes)
end

post('/recipies') do
  name = params.fetch('name')
  new_recipe = Recipe.new(name: name)
  if new_recipe.save()
    redirect('/recipies')
  else
    erb(:error)
  end
end


get('/recipes/:id') do
  id = params.fetch('id').to_i()
  @recipe = Recipe.find(id)
  @ingredients = @recipe.ingredients()
  @categories = Category.all()
  erb(:recipe)
end

post('/recipes/:id') do
  recipe_id =params.fetch('id').to_i
  description = params.fetch('description')
  new_ingredient = Ingredient.create(description: description)
  recipe = Recipe.find(recipe_id)
  recipe.ingredients().push(new_ingredient)

 redirect('/recipies/'.concat(recipe_id.to_s()))
end

patch('/recipes/:id') do
  recipe_id = params.fetch('id').to_i
  recipe_rate = params.fetch('rate')
  recipe = Recipe.find(recipe_id)
  recipe.update(rating: recipe_rate)

  redirect('/recipes/'.concat(recipe_id.to_s()))
end  
