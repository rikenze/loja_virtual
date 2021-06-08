import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_virtual/main.dart';
import 'package:loja_virtual/modelos/item_carrinho.dart';
import 'package:loja_virtual/modelos/movel.dart';
import 'package:loja_virtual/widgets/texto_detalhe.dart';

class CardDetalhe extends StatelessWidget {
  final NumberFormat formatacaoReais =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final Movel movel;
  final Function atualizarTela;

  CardDetalhe({this.movel, this.atualizarTela});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextoDetalhe(
                texto: movel.titulo,
                estilo: Theme.of(context).textTheme.headline1),
            TextoDetalhe(texto: movel.descricao),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${formatacaoReais.format(movel.preco)}',
                      style: Theme.of(context).textTheme.headline1),
                  TextButton(
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () {
                      _adicionarItemCarrinho(
                          ItemCarrinho(quantidade: 1, movel: movel));
                      atualizarTela();
                    },
                    child: Text('Comprar'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _adicionarItemCarrinho(ItemCarrinho item) {
    int indiceMovel =
        Inicio.itensCarrinho.indexWhere((element) => element.movel == movel);

    if (indiceMovel >= 0) /*indice 0 significa que encontrou 1 elemento na lista, e seu indice é 0. Caso não tenha elementos na lista, seu indice será -1.*/
      Inicio.itensCarrinho[indiceMovel].quantidade = Inicio.itensCarrinho[indiceMovel].quantidade + 1;
    else
      Inicio.itensCarrinho.add(item);
  }
}
