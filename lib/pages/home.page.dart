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
  String _result = "0";
  String _expressions_original = "";
  String _result_aux = "";
  bool _after_equal = false;
  List<HistorialWidget> _historial = [];
  String _lastChar = "";

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
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: _historial,
                )
              ],
            ),
          ),
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
      pintarBoton(metodo: delete, componente: Icon(Icons.backspace)),
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
            addValue("\u00B2");
          },
          componente: Text("x\u00B2")),
      pintarBoton(
          metodo: () {
            addValue("√");
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

    if (_expressions.length > 0) {
      _lastChar = _expressions.substring(_expressions.length - 1);
      if (_lastChar != ".") {
        if (!isNumeric(_lastChar) && !isNumeric(val)) {
          _expressions = _expressions.substring(0, _expressions.length - 1);
        }
      }
    }

    print("antes");

    print(_lastChar);

    setState(() {
      if (_expressions == "0") {
        _expressions = val;
      } else {
        if (_after_equal) {
          print("siii");
          _expressions = "";
          _expressions += val;

          _after_equal = false;
        } else {
          print("nooo es");
          _expressions += val;
        }
      }
    });
  }

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  cleanField() {
    _after_equal = false;
    setState(() {
      _expressions = "";
      _result = "";
    });
  }

  delete() {
    setState(() {
      _expressions = (_expressions.length > 1 && _expressions != "0")
          ? _expressions.substring(0, _expressions.length - 1)
          : "0";
    });
  }

  bool validated() {
    return false;
  }

  generateResult() {
    _expressions_original = _expressions;

    if (_expressions.contains("%")) {
      _expressions = _expressions.replaceAll("%", "");
      var arr = _expressions.split('*');
      _expressions = "(" + arr[0] + "*" + arr[1] + ")" + "/100";
    }

    try {
      Parser parser = new Parser();
      ContextModel contextModel = new ContextModel();
      if (_expressions.contains("\u00B2")) {
        _expressions = _expressions.replaceAll("\u00B2", "^2");
      }
      if (_expressions.contains("√")) {
        _expressions = _expressions.replaceAll("√", "");
        _expressions = _expressions + "^0.5";
      }
      Expression expressionFinal = parser.parse(_expressions);
      _after_equal = true;
      setState(() {
        _result = expressionFinal
            .evaluate(EvaluationType.REAL, contextModel)
            .toString();
        _result_aux = _result;
        _expressions = _expressions_original;
      });
      var addHistorial = _expressions_original + " = " + _result;
      if (_historial.length == 3) {
        _historial.removeAt(0);
        _historial.add(HistorialWidget(
          textValue: addHistorial,
        ));
      } else {
        _historial.add(HistorialWidget(
          textValue: addHistorial,
        ));
      }

      print(_historial);
    } catch (e) {
      setState(() {
        _result = "Sintaxis Error";
      });
    }
  }
}

class HistorialWidget extends StatelessWidget {
  final String textValue;
  const HistorialWidget({Key? key, required this.textValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
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
