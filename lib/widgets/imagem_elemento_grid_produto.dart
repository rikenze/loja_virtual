import 'package:flutter/material.dart';

class ImagemElementoGridProduto extends StatelessWidget {
  final String imagem;

  ImagemElementoGridProduto({this.imagem});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
       child: Image(
        fit: BoxFit.cover,
        image: AssetImage('utilidades/assets/imagens/$imagem'),
      ),
    );
  }
}
