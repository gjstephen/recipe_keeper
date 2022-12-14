require 'dotenv/load'   
require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

# controllers
require './controllers/recipes_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

# models
require './models/recipes'
require './models/users'

# helpers
require './helpers/recipes'