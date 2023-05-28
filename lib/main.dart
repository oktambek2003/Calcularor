import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [GestureDetector].

void main() {
  debugPrintGestureArenaDiagnostics = true;
  runApp(const NestedGestureDetectorsApp());
}

enum _OnTapWinner {  none, yellow, green ,white,}

class NestedGestureDetectorsApp extends StatelessWidget {
  const NestedGestureDetectorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Nested GestureDetectors')),
        body: const NestedGestureDetectorsExample(),
      ),
    );
  }
}

class NestedGestureDetectorsExample extends StatefulWidget {
  const NestedGestureDetectorsExample({super.key});

  @override
  State<NestedGestureDetectorsExample> createState() =>
      _NestedGestureDetectorsExampleState();
}

class _NestedGestureDetectorsExampleState
    extends State<NestedGestureDetectorsExample> {
  bool _isYellowTranslucent = false;
  _OnTapWinner _winner = _OnTapWinner.none;
  final Border highlightBorder = Border.all(color: Colors.red, width: 5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('Green onTap');
              setState(() {
                _winner = _OnTapWinner.green;
              });
            },
            onTapDown: (_) => debugPrint('Green onTapDown'),
            onTapCancel: () => debugPrint('Green onTapCancel'),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: _winner == _OnTapWinner.green ? highlightBorder : null,
                color: Colors.green,
              ),
              child: GestureDetector(
                behavior: _isYellowTranslucent
                    ? HitTestBehavior.translucent
                    : HitTestBehavior.opaque,
                onTap: () {
                  debugPrint('Yellow onTap');
                  setState(() {
                    _winner = _OnTapWinner.yellow;
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: _winner == _OnTapWinner.yellow
                          ? highlightBorder
                          : null,
                      color: Colors.amber,
                    ),
                    width: 200,
                    height: 200,
                    child: GestureDetector(
                      behavior: _isYellowTranslucent
                          ? HitTestBehavior.translucent
                          : HitTestBehavior.opaque,
                      onDoubleTap: () {
                        setState(() {
                          _winner = _OnTapWinner.white;
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: _winner==_OnTapWinner.white?highlightBorder:null,
                          color: Colors.white
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Reset'),
                onPressed: () {
                  setState(() {
                    _isYellowTranslucent = false;
                    _winner = _OnTapWinner.none;
                  });
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: Text(
                  'Set Yellow behavior to ${_isYellowTranslucent ? 'opaque' : 'translucent'}',
                ),
                onPressed: () {
                  setState(() => _isYellowTranslucent = !_isYellowTranslucent);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    debugPrintGestureArenaDiagnostics = false;
    super.dispose();
  }
}
