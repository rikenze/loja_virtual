import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/botao_carrinho.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String titulo;
  final bool ehPaginaCarrinho;

  MyAppBar({this.titulo, this.ehPaginaCarrinho = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(titulo, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      actions: [_mudarPaginaCarrinho()],
    );
  }

  _mudarPaginaCarrinho() {
    if (ehPaginaCarrinho) return Container();

    return BotaoCarrinho();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
