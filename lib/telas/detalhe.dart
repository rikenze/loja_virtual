import 'package:flutter/material.dart';
import 'package:loja_virtual/modelos/movel.dart';
import 'package:loja_virtual/widgets/app_bar.dart';
import 'package:loja_virtual/widgets/card_detalhe.dart';

class Detalhe extends StatefulWidget {
  final Movel movel;

  Detalhe({this.movel});

  _DetalheState createState() => _DetalheState();
}

class _DetalheState extends State<Detalhe>{

 void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('utilidades/assets/imagens/${widget.movel.foto}'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(titulo: 'Detalhes'),
        body: Align(
         alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(16),
            height: 200,
            child: CardDetalhe(movel: widget.movel, atualizarTela: _atualizarTela),
          ),
        ),
      ),
    );
  }

  _atualizarTela(){
    setState(() {});
  }
}
