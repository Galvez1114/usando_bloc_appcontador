class Estado {
  final int numero;
  Estado({required this.numero});
}

class stateImagen extends Estado {
  final String url;
  stateImagen({required this.url, required super.numero});
}
