import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tela_inicial.dart';
import 'providers/ponto_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PontoProvider(),
      child: MaterialApp(
        home: TelaInicial(),
      ),
    );
  }
}
