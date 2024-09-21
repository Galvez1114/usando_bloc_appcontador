import 'package:usando_bloc_appcontador/constantes.dart';

class Evento {}

class Incrementar extends Evento {
  final int enCuanto;
  Incrementar({required this.enCuanto});
}

class Decrementar extends Evento {
  final int enCuanto;
  Decrementar({required this.enCuanto});
}

class CambioTipoDigitoA extends Evento {
  final TipoDigito tipoDigito;

  CambioTipoDigitoA(this.tipoDigito);
}

class YaInicializado extends Evento {}
