import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loja_virtual/main.dart';
import 'package:loja_virtual/widgets/app_bar.dart';
import 'package:loja_virtual/widgets/lista_carrinho.dart';

class Carrinho extends StatefulWidget {
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {

  final moedaReais = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    int _valorTotal = _calcularValorTotal();

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Total:', style: Theme.of(context).textTheme.headline4), Text('${moedaReais.format(_valorTotal)}', style: Theme.of(context).textTheme.headline5,)],
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: MyAppBar(titulo: 'Carrinho', ehPaginaCarrinho: true),
      body: _construirTelaCarrinho(),
    );
  }

  _atualizarTela() {
    setState(() {});
  }

  _construirTelaCarrinho(){
    if(Inicio.itensCarrinho.isNotEmpty){
      return ListaCarrinho(atualizarTela: _atualizarTela);
    }

    return Center(child: Text('Seu carrinho está vazio.'));
  }

  int _calcularValorTotal() {
    if (Inicio.itensCarrinho.isNotEmpty)
      return Inicio.itensCarrinho
          .map((e) => e.movel.preco * e.quantidade)
          .reduce((precoAtual, precoNovo) => precoAtual + precoNovo);

    return 0;
  }
}
