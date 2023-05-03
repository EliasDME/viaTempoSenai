import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CaixaTexto extends StatefulWidget {
final controlador;
final msgValidacao;
final texto;
final senha;

  CaixaTexto({super.key, 
  this.controlador, 
  this.msgValidacao, 
  this.texto, 
  this.senha = false});

  @override
  State<CaixaTexto> createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value){
          if(value!.isEmpty){
            return widget.msgValidacao!;
          }
        },
        obscureText: widget.senha,
        decoration: InputDecoration(
                labelText: widget.texto,
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
      ),
      );
  }
}