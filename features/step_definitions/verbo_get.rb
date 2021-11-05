#language: pt
#encoding: utf-8
require "json"

Dado('que eu faca um GET no endpoint de consulta no portal VR') do
  Http.headers('cookie' => JSON.parse(open($COOKIE_FILE).read)['cookies'])
  @get_clientes = Http.get 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'
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
