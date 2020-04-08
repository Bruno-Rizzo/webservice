import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController cepController = TextEditingController();

  String resultado = '';

  _recuperarCep() async {

    String cep = cepController.text;
    String url = 'https://viacep.com.br/ws/$cep/json/';

    http.Response response;

    response = await http.get(url); 
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno['logradouro'];
    String bairro     = retorno['bairro'];
    String localidade = retorno['localidade'];
    String uf         = retorno['uf'];

    setState(() {
      resultado = 'Logradouro: $logradouro\n'
                  'Bairro: $bairro\n'
                  'Localidade: $localidade\n'
                  'UF: $uf';
    });

    print(
      'Resposta Logradouro: $logradouro - bairro: $bairro - localidade: $localidade - uf: $uf'
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de Serviço Web'),
      ),
      body:Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite seu cep ex:11111111',
              ),
              controller: cepController,
            ),
            RaisedButton(
              onPressed: _recuperarCep,
              child: Text('Consumir Serviço'),
              ),
            Text(resultado),
          ],
        ),
      ),
    );

  }

}