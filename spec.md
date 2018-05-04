# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- Sinatra used. Used corneal gem Sinatra app generator.

- [x] Use ActiveRecord for storing information in a database
- ActiveRecord used.

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
- 3 model classes used (User, Recipe, Category).

- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts)
- User has_many categories and user has_many recipes through categories.

- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User)
- Category belongs_to user and recipe belongs_to category

- [x] Include user accounts
- Users can signup, login, logout.

- [x] Ensure that users can't modify content created by other users
- Users can only create, view, edit, and delete their own content.

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- Users can only create, view, edit, and delete their own content.

- [x] Include user input validations
- Usernames and email addresses must be unique. Recipes must have a name and belong to a category.

- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
- Error messages displayed using rack-flash.

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.
- Confirmed.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
