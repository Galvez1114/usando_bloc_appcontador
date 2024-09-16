import 'package:flutter/material.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

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
  String get nume => '$_numero';

  double get medidaTexto {
    int absoluto = _numero.abs();
    if (absoluto < medidaMinimaTexto) return medidaMinimaTexto as double;
    if (absoluto > medidaMaximaTexto) return medidaMaximaTexto as double;
    return absoluto as double;
  }

  Color get elColor {
    if (_numero > intervaloAlerta && _numero < intervaloAlerta.abs())
      return colorAlerta;
    return colorNormal;
  }

  EstadoTexto(super.numero, super._tipoDigito);
}
