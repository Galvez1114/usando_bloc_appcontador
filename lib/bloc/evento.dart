class Evento {}

class Incrementar extends Evento {
  final int enCuanto;
  Incrementar({required this.enCuanto});
}

class Decrementar extends Evento {
  final int enCuanto;
  Decrementar({required this.enCuanto});
}
