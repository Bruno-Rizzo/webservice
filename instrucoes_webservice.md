
Webservice Flutter

1 - importar biblioteca http e nomear ( as... ) e adicioná-la no pubspec.yal nas dependências  ex: http: ^0.12.0+4

2 - importar dart:convert

3 - Inicializar uma variavel do tipo string vazia  ex: String resultado = ''; 

4 - Criar método assíncrono para consumir webservice:

 nomeDoMetodo() async {

5 - Dentro do método instanciar um objeto do tipo http.Response  ex:  http.Response response;

  - Este objeto vai receber a url através do método await ... get()  ex:  response = await http.get(url);

  - criar um Mapa de strings para receber o json, decodificando ele.  ex:

  Map<String , dynamic> retorno = json.decode(response.body);
  String bairro     = retorno['bairro'];
  String uf         = retorno['uf'];
  String localidade = retorno['localidade'];
 
  - Para apresentar na tela é só utilizar o setState((){
      resultado = 'Bairro: $bairro ....'
  });

};

