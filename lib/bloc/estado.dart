import 'package:usando_bloc_appcontador/constantes.dart';

sealed class Estado {
  final int numero;
  Estado(this.numero);
}

class EstadoImagen extends Estado {
  final String _url;
  String get url => _url;
  EstadoImagen(super.numero, this._url);
}

class EstadoTexto extends Estado {
  String get nume => '$numero';
  EstadoTexto(super.numero);
}
