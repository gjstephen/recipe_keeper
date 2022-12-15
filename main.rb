require 'dotenv/load'   
require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

enable :sessions

# controllers
require './controllers/recipes_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/library_controller'

# models
require './models/recipes'
require './models/users'
require './models/library'

# helpers
require './helpers/sessions'
require './helpers/library'