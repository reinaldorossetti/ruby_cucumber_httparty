require 'rspec'
require 'cucumber'
require 'httparty'
require 'faker'
require 'cpf_faker'
require 'json'
require "json_matchers/rspec"
require "allure-cucumber"

# adiciono um modulo pra configurar o httparty.
module Http
  include HTTParty
  base_uri 'https://portal.vr.com.br/api-web/'
  format :json
  open_timeout 30
  headers 'Content-Type' => 'application/json'
end

# Configurando o Json Schema.
schema_directory = "#{Dir.pwd}/features/support/json_schema"
p $SCHEMA_JSON = "#{schema_directory}/establishment.json"
JsonMatchers.schema_root = schema_directory
# pegado os cookies.
$COOKIE_FILE = "#{Dir.pwd}/features/support/headers/cookie.json"

