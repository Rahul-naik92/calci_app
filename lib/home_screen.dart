import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Text(
                      userInput.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )
                  ],
                ),
              )),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: "AC",
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+/-",
                          onPress: () {
                            userInput = '${userInput}+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "%",
                          onPress: () {
                            userInput = '${userInput}%';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "/",
                          onPress: () {
                            userInput = '${userInput}/';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "7",
                          onPress: () {
                            userInput = '${userInput}7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "8",
                          onPress: () {
                            userInput = '${userInput}8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "9",
                          onPress: () {
                            userInput = '${userInput}9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "x",
                          onPress: () {
                            userInput = '${userInput}x';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "4",
                          onPress: () {
                            userInput = '${userInput}4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "5",
                          onPress: () {
                            userInput = '${userInput}5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "6",
                          onPress: () {
                            userInput = '${userInput}6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "-",
                          onPress: () {
                            userInput = '${userInput}-';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "1",
                          onPress: () {
                            userInput = '${userInput}1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "2",
                          onPress: () {
                            userInput = '${userInput}2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "3",
                          onPress: () {
                            userInput = '${userInput}3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "+",
                          onPress: () {
                            userInput = '${userInput}+';
                            setState(() {});
                          },
                          color: Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: "0",
                          onPress: () {
                            userInput = '${userInput}0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: ".",
                          onPress: () {
                            userInput = '${userInput}.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "DEL",
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: "=",
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);

    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
