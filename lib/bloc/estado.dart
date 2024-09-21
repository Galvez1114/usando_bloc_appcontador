import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';
import 'package:usando_bloc_appcontador/constantes.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

sealed class Estado {
  late final int _numero;
  int get numero => _numero;

  late final TipoDigito _tipoDigito;
  TipoDigito get tipoDigito => _tipoDigito;

  Estado(this._numero, this._tipoDigito);
}

class EstadoImagen extends Estado {
  final String _url;
  String get url => _url;
  EstadoImagen(super.numero, this._url, super._tipoDigito);
}

class EstadoTexto extends Estado {
  final arabicNumbers = ArabicNumbers();
  String get nume {
    return switch (tipoDigito) {
      (TipoDigito.occidentales) => '$_numero',
      (TipoDigito.romanos) => numero.abs().toRomanNumeralString() ?? "0",
      (TipoDigito.arabigo) => arabicNumbers.convert(numero)
    };
  }

  double get medidaTexto {
    int absoluto = _numero.abs();
    if (absoluto < medidaMinimaTexto) return medidaMinimaTexto.toDouble();
    if (absoluto > medidaMaximaTexto) return medidaMaximaTexto.toDouble();
    return absoluto as double;
  }

  Color get elColor {
    if (_numero > intervaloAlerta && _numero < intervaloAlerta.abs()) {
      return colorAlerta;
    }
    return colorNormal;
  }

  EstadoTexto(super.numero, super._tipoDigito);
}
