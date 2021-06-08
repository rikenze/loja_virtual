import 'package:flutter/material.dart';
import 'package:loja_virtual/modelos/movel.dart';
import 'package:loja_virtual/widgets/elemento_grid_produto.dart';

class GridProduto extends StatelessWidget {
  final List<Map<String, dynamic>> moveis;
  Function atualizaTelaInicial;

  GridProduto({this.moveis, this.atualizaTelaInicial});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: moveis.length,
      itemBuilder: (BuildContext context, int index) {
        final Movel movel = Movel.fromJson(moveis[index]);

        return ElementoGridProduto(movel: movel, atualizaTelaInicial: atualizaTelaInicial);
      },
    );
  }
}
