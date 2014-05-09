require 'faker'

todolist = Todolist.create(name: "groceries")

job = Task.create(chore: Faker::Commerce.product_name, todolist_id: todolist.id)

