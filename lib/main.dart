import 'package:flutter/material.dart';
import 'package:loja_virtual/modelos/item_carrinho.dart';
import 'package:loja_virtual/paleta_cores.dart';
import 'package:loja_virtual/telas/carrinho.dart';
import 'package:loja_virtual/widgets/grid_produtos.dart';

import 'modelos/movel_json.dart';
import 'widgets/app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/carrinho': (context) => Carrinho(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: PaletaCores().lilas,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20,
              fontFamily: 'Alata',
              fontWeight: FontWeight.bold,
              color: Colors.black),
          headline2: TextStyle(
              fontSize: 20,
              fontFamily: 'Alata',
              fontWeight: FontWeight.bold,
              color: Colors.white),
          headline3: TextStyle(
              fontSize: 16,
              fontFamily: 'Alata',
              fontWeight: FontWeight.bold,
              color: Colors.black),
          headline4: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  final moveis = MovelJson().getMovelJson();

  static List<ItemCarrinho> itensCarrinho = <ItemCarrinho>[];

  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: MyAppBar(titulo: 'Início'),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 20, top: 10, bottom: 10),
                    child: Divider(),
                  ),
                ),
                Text('Produtos'),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 30, top: 10, bottom: 10),
                    child: Divider(),
                  ),
                ),
              ],
            ),
            Flexible(
              child: GridProduto(moveis: widget.moveis, atualizaTelaInicial: _atualizaTela),
            ),
          ],
        ));
  }

  _atualizaTela(){
    setState(() {});
  }
}
