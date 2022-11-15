import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    const styleText = TextStyle(fontSize: 30);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple Counter"),
          elevation: 10.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActions(
            addValue: _addState,
            minusValue: _minusState,
            setZeroValue: _setZeroState),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Número de clicks", style: styleText),
              Text(
                "$counter",
                style: styleText,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addState() => setState(() => counter++);
  void _minusState() => setState(() => counter--);
  void _setZeroState() => setState(() => counter = 0);
}

class FloatingActions extends StatelessWidget {
  const FloatingActions({
    Key? key,
    required this.addValue,
    required this.minusValue,
    required this.setZeroValue,
  }) : super(key: key);

  final Function addValue;
  final Function minusValue;
  final Function setZeroValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonOperation(
            icon: Icons.exposure_plus_1, operation: () => addValue()),
        ButtonOperation(icon: Icons.clear, operation: () => setZeroValue()),
        ButtonOperation(
            icon: Icons.exposure_minus_1, operation: () => minusValue()),
      ],
    );
  }
}

class ButtonOperation extends StatelessWidget {
  const ButtonOperation({Key? key, required this.icon, required this.operation})
      : super(key: key);

  final IconData icon;
  final Function operation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => operation(), child: Icon(icon));
  }
}
