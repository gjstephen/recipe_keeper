require 'dotenv/load'   
require 'sinatra'
require 'bcrypt'
require './db/db'
require 'httparty'

# controllers
require './controllers/recipes_controller'

# models
require './models/recipes'

# helpers
require './helpers/recipes'