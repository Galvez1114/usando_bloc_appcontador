import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usando_bloc_appcontador/bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    var estado = context.watch<MiBloc>().state;
    return switch (estado) {
      (EstadoTexto t) => Text(t.nume),
      (EstadoImagen i) => Image.network(i.url)
    };
  }
}
