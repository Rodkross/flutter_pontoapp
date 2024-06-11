import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/ponto.dart';

class PontoProvider with ChangeNotifier {
  List<Ponto> _registros = [];

  List<Ponto> get registros => _registros;

  Ponto? get registroAtual {
    if (_registros.isNotEmpty && _isHoje(_registros.last.data)) {
      return _registros.last;
    }
    return null;
  }

  void registrarEntrada() {
    if (registroAtual == null) {
      _registros.add(Ponto(data: DateTime.now(), entrada: DateTime.now()));
      notifyListeners();
    } else {
      print("Entrada já registrada para o dia atual.");
    }
  }

  void registrarSaida() {
    if (registroAtual != null && registroAtual!.saida == null && registroAtual!.fimIntervalo != null) {
      registroAtual!.saida = DateTime.now();
      notifyListeners();
    } else {
      print("Não é possível registrar saída sem registrar fim do intervalo.");
    }
  }

  void registrarInicioIntervalo() {
    if (registroAtual != null && registroAtual!.inicioIntervalo == null) {
      registroAtual!.inicioIntervalo = DateTime.now();
      notifyListeners();
    } else {
      print("Início de intervalo já registrado.");
    }
  }

  void registrarFimIntervalo() {
    if (registroAtual != null && registroAtual!.inicioIntervalo != null && registroAtual!.fimIntervalo == null) {
      registroAtual!.fimIntervalo = DateTime.now();
      notifyListeners();
    } else {
      print("Não é possível registrar fim do intervalo sem registrar início do intervalo.");
    }
  }

  String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '---';
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(dateTime);
  }

  bool _isHoje(DateTime data) {
    final hoje = DateTime.now();
    return data.year == hoje.year && data.month == hoje.month && data.day == hoje.day;
  }
}
