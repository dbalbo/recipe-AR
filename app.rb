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
