import 'package:flutter/material.dart';
import 'package:loja_virtual/modelos/movel.dart';
import 'package:loja_virtual/telas/detalhe.dart';
import 'package:loja_virtual/widgets/imagem_elemento_grid_produto.dart';
import 'package:loja_virtual/widgets/titulo_elemento_grid_produto.dart';

import 'degrade_elemento_grid_produto.dart';

class ElementoGridProduto extends StatelessWidget {
  final Movel movel;
  Function atualizaTelaInicial;

  ElementoGridProduto({this.movel, this.atualizaTelaInicial});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detalhe(movel: movel)),
        ).then((value) => atualizaTelaInicial())
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(spreadRadius: 2, blurRadius: 8, color: Colors.black12)
          ],
        ),
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImagemElementoGridProduto(imagem: movel.foto),
              DegradeElementoGridProduto(),
              TituloElementoGridProdutos(titulo: movel.titulo)
            ],
          ),
        ),
      ),
    );
  }
}
