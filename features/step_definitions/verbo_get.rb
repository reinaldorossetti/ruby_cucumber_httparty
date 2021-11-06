#language: pt
#encoding: utf-8

Dado('que eu faca um GET no endpoint de consulta no portal VR') do
  @get_clientes = Http.get '/api-web/comum/enumerations/VRPAT'
end

Quando('seleciono um estabelecimento aleatoriamente') do
  # uso uma estrutura de dados chamada OpenStruct, seleciono o que desejo e volto pra json.
  dataObject = JSON.parse(@get_clientes.body, object_class: OpenStruct)
  p @establishment = dataObject.typeOfEstablishment.sample.to_h.to_json
end

Entao('valido o json schema do estabelecimento') do
  expect(@get_clientes.code).to eq 200
  expect(@establishment).to match_json_schema('establishment')
end

When(/^que eu faca um GET no endpoint de consulta no portal VR sem token$/) do
  Http.headers 'cookie' => ""
  @get_clientes = Http.get '/api-web/comum/enumerations/VRPAT'
end

When(/^valido a resposta de error$/) do
  expect(@get_clientes.code).to eq 200
  puts @get_clientes.body
  expect(@get_clientes.body).to include("Request unsuccessful. Incapsula incident")
end