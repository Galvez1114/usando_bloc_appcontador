import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usando_bloc_appcontador/bloc/bloc.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});

  @override
  Widget build(BuildContext context) {
    var numero = context.watch<MiBloc>().state.numero;

    return Text('$numero');
  }
}
