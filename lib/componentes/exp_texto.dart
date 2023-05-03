import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExpandedTexto extends StatefulWidget {

  final msg;
  final style;

  ExpandedTexto({super.key, this.msg, this.style});
  @override
  State<ExpandedTexto> createState() => _ExpandedTextoState();
}

class _ExpandedTextoState extends State<ExpandedTexto> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(
      widget.msg,
      style: const TextStyle(color: Colors.red, fontSize: 20),
     )
    );
  }
}