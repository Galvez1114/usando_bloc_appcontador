import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usando_bloc_appcontador/bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MiBloc, Estado>(
      builder: (context, state) {
        return switch (state) {
          (EstadoTexto t) => Text(
              t.nume,
              style:
                  TextStyle(fontSize: state.medidaTexto, color: state.elColor),
            ),
          (EstadoImagen i) => Image.network(i.url),
        };
      },
      listener: (context, state) {
        SnackBar snackBar =
            const SnackBar(content: Text('cuidado con el 8...'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      listenWhen: (previous, current) => current.numero == 8,
    );
  }
}
