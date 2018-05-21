# Rails Polymorphic AccessLogger

This application shows how to use Rails' polymorphic associations to track user access for different models.

### Why is this needed?
Let's say you have a bunch of models and you want to know who created and updated their records. You could add created_by and updated_by fields to each model, but this is not DRY at all. You need to use polymorphic associations. Basically, we will use one database table to track the created by and updated by information for any model.

### How does it work?
The magic is in app/module/access-logger.rb. By including this module in the cheese and monkey models we can easily insert and update the created_by and updated_by fields. We need to slightly modify our create and update actions to pass in the user information, but otherwise everything is handled automatically.

### The details
Include the access_logger module in the model:
```
# app/models/cheese.rb
class Cheese < ApplicationRecord
  include AccessLogger
end
```
That's all that's in the model. Really! You might add validations and whatnot, of course.

The controller actions look like this:
```
# app/controllers/cheeses_controller.rb
def create
  temp_cheese_params = cheese_params
  temp_cheese_params[:access_user] = User.first
  @cheese = Cheese.new temp_cheese_params
  respond_to do |format|
    if @cheese.save
      format.html {redirect_to @cheese, notice: 'Cheese was successfully created.'}
      format.json {render :show, status: :created, location: @cheese}
    else
      format.html {render :new}
      format.json {render json: @cheese.errors, status: :unprocessable_entity}
    end
  end
end
  
def update
  temp_cheese_params = cheese_params
  temp_cheese_params[:access_user] = User.last
  @cheese.assign_attributes temp_cheese_params
  respond_to do |format|
    if @cheese.save
      format.html {redirect_to @cheese, notice: 'Cheese was successfully updated.'}
      format.json {render :show, status: :ok, location: @cheese}
    else
      format.html {render :edit}
      format.json {render json: @cheese.errors, status: :unprocessable_entity}
    end
  end
end
```

We pass in the user as a parameter, which gets picked up by the AccessLogger module. Notice how we add the first user in the create action, but the last user in the update action. This is just to show that the AccessLog does indeed set the created_by and updated_by users correctly. If you look at the AccessLog table you'll see everything is tracked appropriately.

```
#<ActiveRecord::Relation [#<AccessLog id: 7, created_by_id: 1, updated_by_id: 2, access_loggable_type: "Monkey", access_loggable_id: 4, created_at: "2018-05-21 00:59:46", updated_at: "2018-05-21 01:00:09">, #<AccessLog id: 8, created_by_id: 1, updated_by_id: 2, access_loggable_type: "Cheese", access_loggable_id: 5, created_at: "2018-05-21 01:00:32", updated_at: "2018-05-21 01:00:48">]>
```
 ---
 
#### Boring details
This app uses:

* Ruby version: 2.4.1

* Rails version: 5.1.6

* Database creation: default sqlite3 database.

* Database initialization: please run "rails db:seed" on the command line to create the test users.
