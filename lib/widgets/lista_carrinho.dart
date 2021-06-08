import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_virtual/main.dart';
import 'package:loja_virtual/modelos/item_carrinho.dart';

class ListaCarrinho extends StatelessWidget {
  Function atualizarTela;
  final List<ItemCarrinho> carrinho = Inicio.itensCarrinho;
  final moedaReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  ListaCarrinho({this.atualizarTela});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carrinho.length,
      itemBuilder: (BuildContext context, int index) {
        final item = carrinho[index];
        final movel = item.movel;

        return Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage('utilidades/assets/imagens/${movel.foto}'),
                    height: 92,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 92,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${movel.titulo}', style: Theme.of(context).textTheme.headline3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${moedaReais.format(movel.preco)}'),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _adicionarQtd(item);
                                    atualizarTela();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.add, size: 14),
                                  ),
                                ),
                                Text('${item.quantidade}'),
                                GestureDetector(
                                  onTap: () {
                                    _diminuiQtd(item);
                                    atualizarTela();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.remove, size: 14),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _adicionarQtd(ItemCarrinho itemCarrinho) {
    itemCarrinho.quantidade++;
  }

  _diminuiQtd(ItemCarrinho itemCarrinho) {
    if (itemCarrinho.quantidade > 1)
      itemCarrinho.quantidade--;
    else
      carrinho.remove(itemCarrinho);
  }
}
