#language: pt
#encoding: utf-8
require "json"

Dado('que eu faca um GET no endpoint de consulta no portal VR') do
  Http.headers('cookie' => 'incap_ses_1472_2606993=vJWwZPKdpVAq00bFQ5htFPZVhGEAAAAASyruSApNz95sKQeboJp7bA==; dtCookie=v_4_srv_1_sn_D8E62E6300FBF39E93A40D8EB8FF6934_perc_100000_ol_0_mul_1_app-3Adca864c45aa61d26_0; ROUTEID=.springApp1; visid_incap_2606993=f3sq1y9kS1KDk3VxP4fonPZVhGEAAAAAQkIPAAAAAACAgBKgAbHcrHIMClb55iocm0I/bxMCzHER')
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
