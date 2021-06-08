import 'package:flutter/material.dart';

class TextoDetalhe extends StatelessWidget {
  final String texto;
  final TextStyle estilo;

  TextoDetalhe({this.texto, this.estilo});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      child: _defineTextStyle(),
    );
  }

  _defineTextStyle(){
    if(estilo != null)
      return Text(texto, style: estilo);

    return Text(texto);
  }
}
