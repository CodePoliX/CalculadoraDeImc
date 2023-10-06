import 'package:flutter/material.dart';
import 'package:imc/Interface/calculadora_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _loadingPage(); // Corrija a chamada do método para `_loadingPage`
  }

  void _loadingPage() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const CalculadoraPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Row(
            children: [
              Expanded(child: Container()),
              Expanded(child: Image.asset("lib/images/balance.png")),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
