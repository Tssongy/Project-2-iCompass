require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'

enable :sessions

require_relative 'db/db'
require_relative 'models/user'
require_relative 'models/dashboard'
require_relative 'models/assignment'
require_relative 'models/submission'

require_relative 'controllers/dashboards_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/submissions_controller'

require_relative 'helpers/sessions_helper'

