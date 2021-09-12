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
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Juan Cuero"),
        backgroundColor: Color(0xff202124),
      ),
      body: Container(
        color: Color(0xff202124),
        child: Column(
          children: [
            ContainerShowWidget(textValue: "", fontSize: 40),
            ContainerShowWidget(textValue: "0", fontSize: 30),
            Expanded(
              flex: 2,
              child: Container(
                //width: double.infinity,
                // height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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

class ContainerShowWidget extends StatelessWidget {
  final String textValue;
  final double fontSize;

  const ContainerShowWidget(
      {Key? key, required this.textValue, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xff3C4043), borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              textValue,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
            )
          ],
        ),
        //color: Color(0xff3C4043),
      ),
    );
  }
}
