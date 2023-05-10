import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

var type = ("");
String resault() {
  String temp = "/*-+%";

  List<int> ind = [];
  List<num> numbers = [];
  for (int i = 0; i < type.length; i++) {
    if (temp.contains(type[i])) {
      ind.add(i);
    }
  }
  int q = 0;
  for (int i in ind) {
    numbers.add(num.parse(type.substring(q, i)));
    q = i + 1;
  }
  numbers.add(num.parse(type.substring(q, type.length)));
  for (int i = 0; i < temp.length; i++) {
    for (int j = 0; j < ind.length; j++) {
      if (temp[i] == type[ind[j]]) {
        if (temp[i] == "+") {
          numbers[j] = numbers[j] + numbers[j + 1];
        }
        if (temp[i] == "-") {
          numbers[j] = numbers[j] - numbers[j + 1];
        }
        if (temp[i] == "*") {
          numbers[j] = numbers[j] * numbers[j + 1];
        }
        if (temp[i] == "/") {
          numbers[j] = numbers[j] / numbers[j + 1];
        }
        numbers.removeAt(j + 1);
        ind.removeAt(j);
        j--;
      }
    }
  }
  type = numbers[0].toString();
  return type;
}
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  num multlipline = 1;
  num doo = 1;
  Widget buttons(String buttonName) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              type += buttonName;
  //              String ans = "/*-+%";
  // for (int i = 0; i < type.length; i++) {
  //   for (int a = 0; a < ans.length; a++) {
  //     if (type[i] == ans[a]) {
  //       for (int y = 0; y < ans.length; y++) {
  //         if (type[i + 1] == ans[y]) {
  //           type = type.substring(0, i) + type.substring(i+1, type.length);
  //           print(type);
  //           }
  //         }
  //       }
  //     }
  //  }
});},
          child: Text(buttonName)),
    );
  }

  String neww = "";
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: TextField(
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: type),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                doo = double.parse(type);
                                type = (doo * doo).toString();
                              });
                            },
                            child: Text("x2")),
                        buttons("%"),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                neww = type.substring(0, type.length - 1);
                                type = neww;
                              });
                            },
                            child: Text("C")),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                type = "";
                              });
                            },
                            child: Text("clear"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("1"),
                        buttons("2"),
                        buttons("3"),
                        buttons("+")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("4"),
                        buttons("5"),
                        buttons("6"),
                        buttons("-"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("7"),
                        buttons("8"),
                        buttons("9"),
                        buttons("*"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buttons("."),
                        buttons("0"),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                resault();
                              });
                            },
                            child: Text("=")),
                        buttons("/")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
