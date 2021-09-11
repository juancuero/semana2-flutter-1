import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semanda2flutter1/components/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 6;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [Text("Zona resultados")],
              ),
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  )
                ],
              ),
              color: Color(0xff3C4043),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              //width: double.infinity,
              // height: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _listaBotones1(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _listaBotones2(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _listaBotones3(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _listaBotones4(),
                  ),
                ],
              ),
              color: Color(0xff202124),
            ),
          )
        ],
      ),
    );
  }

  _listaBotones1() {
    return [
      pintarBoton(metodo: () {}, componente: Text("7")),
      pintarBoton(metodo: () {}, componente: Text("8")),
      pintarBoton(metodo: () {}, componente: Text("9")),
      pintarBoton(metodo: () {}, componente: Text("/")),
      pintarBoton(metodo: () {}, componente: Text("<-")),
      pintarBoton(metodo: () {}, componente: Text("C")),
    ];
  }

  _listaBotones2() {
    return [
      pintarBoton(metodo: () {}, componente: Text("4")),
      pintarBoton(metodo: () {}, componente: Text("5")),
      pintarBoton(metodo: () {}, componente: Text("6")),
      pintarBoton(metodo: () {}, componente: Text("x")),
      pintarBoton(metodo: () {}, componente: Text("(")),
      pintarBoton(metodo: () {}, componente: Text(")")),
    ];
  }

  _listaBotones3() {
    return [
      pintarBoton(metodo: () {}, componente: Text("1")),
      pintarBoton(metodo: () {}, componente: Text("2")),
      pintarBoton(metodo: () {}, componente: Text("3")),
      pintarBoton(metodo: () {}, componente: Text("-")),
      pintarBoton(metodo: () {}, componente: Text("x²")),
      pintarBoton(metodo: () {}, componente: Text("√")),
    ];
  }

  _listaBotones4() {
    return [
      pintarBoton(metodo: () {}, componente: Text("0")),
      pintarBoton(metodo: () {}, componente: Text(".")),
      pintarBoton(metodo: () {}, componente: Text("%")),
      pintarBoton(metodo: () {}, componente: Text("+")),
      pintarBoton(
          metodo: () {},
          componente: Text("="),
          valorflex: 2,
          btnColor: Colors.green),
    ];
  }
}
