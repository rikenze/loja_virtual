import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/main.dart';
import 'package:loja_virtual/widgets/indicador_botao_item_carrinho.dart';

class BotaoCarrinho extends StatefulWidget {

  @override
  _BotaoCarrinhoState createState() => _BotaoCarrinhoState();
}

class _BotaoCarrinhoState extends State<BotaoCarrinho>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/carrinho').then((value) => setState((){}));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),
          alignment: Alignment.centerRight,
          height: 40,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: _visibilidadeIndicadorItemBotaoCarrinho()
      ),
    );
  }

  _visibilidadeIndicadorItemBotaoCarrinho() {
    if (Inicio.itensCarrinho.length > 0) {
      return Stack(
        children: [
          Image(
            image: AssetImage('utilidades/assets/icones/carrinho.png'),
            height: 30,
          ),
          IndicadorBotaoItemCarrinho()
        ],
      );
    }

    return Image(
      image: AssetImage('utilidades/assets/icones/carrinho.png'),
      height: 30,
    );
  }

  _atualizarTela(){
    setState(() {

    });
  }
}
