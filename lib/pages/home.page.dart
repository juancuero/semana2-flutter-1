import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:semanda2flutter1/components/button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _expressions = "";
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Juan Cuero"),
        backgroundColor: Color(0xff202124),
      ),
      body: bodyWidget(),
    );
  }

  Container bodyWidget() {
    return Container(
      color: Color(0xff202124),
      child: Column(
        children: [
          ContainerShowWidget(textValue: "$_result", fontSize: 40),
          ContainerShowWidget(textValue: "$_expressions", fontSize: 30),
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
    );
  }

  _listaBotones1() {
    return [
      pintarBoton(
          metodo: () {
            addValue("7");
          },
          componente: Text("7")),
      pintarBoton(
          metodo: () {
            addValue("8");
          },
          componente: Text("8")),
      pintarBoton(
          metodo: () {
            addValue("9");
          },
          componente: Text("9")),
      pintarBoton(
          metodo: () {
            addValue("/");
          },
          componente: Text("/")),
      pintarBoton(
          metodo: () {
            addValue("remove_ant");
          },
          componente: Text("<-")),
      pintarBoton(
          metodo: () {
            cleanField();
          },
          componente: Text("C")),
    ];
  }

  _listaBotones2() {
    return [
      pintarBoton(
          metodo: () {
            addValue("4");
          },
          componente: Text("4")),
      pintarBoton(
          metodo: () {
            addValue("5");
          },
          componente: Text("5")),
      pintarBoton(
          metodo: () {
            addValue("6");
          },
          componente: Text("6")),
      pintarBoton(
          metodo: () {
            addValue("*");
          },
          componente: Text("x")),
      pintarBoton(
          metodo: () {
            addValue("(");
          },
          componente: Text("(")),
      pintarBoton(
          metodo: () {
            addValue(")");
          },
          componente: Text(")")),
    ];
  }

  _listaBotones3() {
    return [
      pintarBoton(
          metodo: () {
            addValue("1");
          },
          componente: Text("1")),
      pintarBoton(
          metodo: () {
            addValue("2");
          },
          componente: Text("2")),
      pintarBoton(
          metodo: () {
            addValue("3");
          },
          componente: Text("3")),
      pintarBoton(
          metodo: () {
            addValue("-");
          },
          componente: Text("-")),
      pintarBoton(
          metodo: () {
            addValue("");
          },
          componente: Text("x²")),
      pintarBoton(
          metodo: () {
            addValue("");
          },
          componente: Text("√")),
    ];
  }

  _listaBotones4() {
    return [
      pintarBoton(
          metodo: () {
            addValue("0");
          },
          componente: Text("0")),
      pintarBoton(
          metodo: () {
            addValue(".");
          },
          componente: Text(".")),
      pintarBoton(
          metodo: () {
            addValue("%");
          },
          componente: Text("%")),
      pintarBoton(
          metodo: () {
            addValue("+");
          },
          componente: Text("+")),
      pintarBoton(
          metodo: () {
            generateResult();
          },
          componente: Text("="),
          valorflex: 2,
          btnColor: Colors.green),
    ];
  }

  addValue(String val) {
    print("Llega $val");
    setState(() {
      if (_expressions == "0")
        _expressions = val;
      else
        _expressions += val;
    });
  }

  cleanField() {
    setState(() {
      _expressions = "";
      _result = "";
    });
  }

  generateResult() {
    try {
      Parser parser = new Parser();
      ContextModel contextModel = new ContextModel();
      Expression expressionFinal = parser.parse(_expressions);
      setState(() {
        _result = expressionFinal
            .evaluate(EvaluationType.REAL, contextModel)
            .toString();
      });
    } catch (e) {
      setState(() {
        _result = "Sintaxis Error";
      });
    }
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
