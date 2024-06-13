import 'package:flutter/material.dart';
import 'ponto_screen.dart';

class TelaInicial extends StatefulWidget {
  final String usuario;

  TelaInicial({required this.usuario});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  void initState() {
    super.initState();
    _loadScreen();
  }

  _loadScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PontoScreen(usuario: widget.usuario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bem-vindo, ${widget.usuario}! 😃',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
