
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int i = 0;
  bool piyoz = false;
  bool karam = false;
  bool garmdori = false;
  int sum = 0;
  List<int> cost = [0, 20000, 30000, 40000];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(right: 100),
                child: Image.network(
                    "https://static.tildacdn.com/tild3964-3164-4163-b465-613334373931/DTxNmydUQAE6yI7.jpg"),
              ),
              Container(
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text(
                        "Easy",
                        style: TextStyle(color: Colors.blue),
                      ),
                      value: 1,
                      groupValue: i,
                      onChanged: (value) {
                        setState(() {
                          sum -= cost[i];
                          i = value!;
                          sum += cost[i];
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        "Normal",
                        style: TextStyle(color: Colors.blue),
                      ),
                      value: 2,
                      groupValue: i,
                      onChanged: (value) {
                        setState(() {
                          sum -= cost[i];
                          i = value!;
                          sum += cost[i];
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text(
                        "Big",
                        style: TextStyle(color: Colors.blue),
                      ),
                      value: 3,
                      groupValue: i,
                      onChanged: (value) {
                        setState(() {
                          sum -= cost[i];
                          i = value!;
                          sum += cost[i];
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              value: piyoz,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == false) {
                                    sum -= 10000;
                                  } else {
                                    sum += 10000;
                                  }
                                  piyoz = value!;
                                });
                              }),
                          Text(
                            "Piyozli",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              value: karam,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == false) {
                                    sum -= 15000;
                                  }

else {
                                    sum += 15000;
                                  }

                                  karam = value!;
                                });
                              }),
                          Text(
                            "karamli",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                              value: garmdori,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value == false) {
                                    sum -= 17000;
                                  } else {
                                    sum += 17000;
                                  }

                                  garmdori = value!;
                                });
                              }),
                          Text(
                            "garmdorili",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 80),
                      child: Column(
                        children: [
                          Text(
                            "Sizning buyutrmangiz narxi:",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                          Text(
                            "${sum}",
                            style: TextStyle(fontSize: 40, color: Colors.red),
                          )
                        ],
                      ),
                    )
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