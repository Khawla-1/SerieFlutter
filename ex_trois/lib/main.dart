import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operation',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Opérations')),
        body: Center(
          child: AverageCalculator(),
        ),
      ),
    );
  }
}

class AverageCalculator extends StatefulWidget {
  @override
  _AverageCalculatorState createState() => _AverageCalculatorState();
}

class _AverageCalculatorState extends State<AverageCalculator> {
  final _firstNumberController = TextEditingController();
  final _secondNumberController = TextEditingController();
  late double _average = 0;
  late double _somme = 0;
  late double _produit = 0;
  void _calculerMoyenne() {
    setState(() {
      _average = ((_firstNumberController.text.isNotEmpty &&
              _secondNumberController.text.isNotEmpty)
          ? (double.parse(_firstNumberController.text) +
                  double.parse(_secondNumberController.text)) /
              2
          : null)!;
    });
  }

  void _calculerSomme() {
    setState(() {
      _somme = ((_firstNumberController.text.isNotEmpty &&
              _secondNumberController.text.isNotEmpty)
          ? (double.parse(_firstNumberController.text) +
              double.parse(_secondNumberController.text))
          : null)!;
    });
  }

  void _calculerProduit() {
    setState(() {
      _produit = ((_firstNumberController.text.isNotEmpty &&
              _secondNumberController.text.isNotEmpty)
          ? (double.parse(_firstNumberController.text) *
              double.parse(_secondNumberController.text))
          : null)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number, // How to get number
              controller: _firstNumberController,
              decoration: InputDecoration(
                hintText: 'Saisir le premier nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _secondNumberController,
              decoration: InputDecoration(
                hintText: 'Saisir le deuxième nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                _calculerMoyenne();
                _calculerSomme();
                _calculerProduit();
              },
              child: const Text('Afficher la moyenne, la somme et le produit'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            // ignore: unnecessary_null_comparison
            _average == null
                ? Container()
                : Text(
                    'La moyenne est : $_average',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    ),
                  ),
            const SizedBox(
              height: 20.0,
            ),
            // ignore: unnecessary_null_comparison
            _somme == null
                ? Container()
                : Text(
                    'La somme est : $_somme',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),
                  ),
            const SizedBox(
              height: 20.0,
            ),
            // ignore: unnecessary_null_comparison
            _produit == null
                ? Container()
                : Text(
                    'Le produit est : $_produit',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 241, 7, 210),
                      fontSize: 20.0,
                    ),
                  ),
          ],
        ));
  }
}
