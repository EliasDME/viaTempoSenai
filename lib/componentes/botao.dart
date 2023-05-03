import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Botao extends StatefulWidget {
  final texto;
  final funcao;

  Botao({super.key, this.texto, this.funcao});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(12),
    child: Column(children: [
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(75, 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
                  )
                ), onPressed: widget.funcao, child: Text(widget.texto),
              )
    ],),
    );
  }
}