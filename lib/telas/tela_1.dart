import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:projeto/componentes/botao.dart';
import 'package:projeto/componentes/caixa_texto.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  final _formKey = GlobalKey<FormState>();
  final cep = TextEditingController();
  String cidade = 'Cidade: xxx';
  String data = 'Data atual: xx/xx/xxxx';
  String hora = 'xx:xx';
  String tempMax = 'XX°';
  String descricaoTemp = 'xxxxx';

  @override
  Widget build(BuildContext context) {

    iniciar() async{
      final urlViaLocal = "https://viacep.com.br/ws/${cep.text}/json/";
      Response respota = await get(Uri.parse(urlViaLocal));
      Map local = json.decode(respota.body);
      setState(() {
        cidade = 'Cidade: ${local['logradouro']}';
      });

      final urlTempo = "https://api.hgbrasil.com/weather?format=json-cors&key=5ed1a85b&city_name=${cidade}";
      Response respostaTempo = await get(Uri.parse(urlTempo));
      Map tempo = json.decode(respostaTempo.body);
      setState(() {
        data = 'Data: ';
      });
    }

    criaBody(){
      return Form(
        key: _formKey,
        child: 
         Column(
          children: [
            Row(
              children: [
                Expanded( child: 
                CaixaTexto(
                  controlador: cep,
                  msgValidacao: 'Digite o CEP',
                  texto: 'Digite o CEP',
                  senha: false,
                  ),
                  ),
                  Botao(
                    texto: 'Iniciar',
                    funcao: iniciar,
                  )
              ],
            ),
            Column(
              children: [
                Text(cidade),
                Text(data),
                Text(hora),
                Text(tempMax),
                Text(descricaoTemp)
              ],
            )
          ],
         ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
      ),
      body: criaBody(),
    );
  }
}