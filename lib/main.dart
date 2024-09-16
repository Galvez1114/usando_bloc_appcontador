import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usando_bloc_appcontador/bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';
import 'package:usando_bloc_appcontador/informacion.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MiBloc(),
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var estado = context.watch<MiBloc>().state;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'App de Contador',
          ),
          actions: [
            SegmentedButton(
                onSelectionChanged: (tipo) {
                  context.read<MiBloc>().add(CambioTipoDigitoA(tipo.first));
                },
                segments: const [
                  ButtonSegment(
                    value: TipoDigito.occidentales,
                    label: Text('Occidentales'),
                  ),
                  ButtonSegment(
                    value: TipoDigito.romanos,
                    label: Text('Romanos'),
                  ),
                  ButtonSegment(
                    value: TipoDigito.arabigo,
                    label: Text('Arabigo'),
                  ),
                ],
                selected: {
                  estado.tipoDigito
                })
          ],
        ),
        body: const Center(
          child: Informacion(),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MiBoton(
                  miIcono: Icons.add,
                  miEventto: Incrementar(enCuanto: 1),
                ),
                MiBoton(
                  miIcono: Icons.remove,
                  miEventto: Decrementar(enCuanto: 1),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MiBoton(
                  miIcono: Icons.yard,
                  miEventto: Incrementar(enCuanto: 3),
                ),
                MiBoton(
                    miIcono: Icons.add_comment,
                    miEventto: Decrementar(enCuanto: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MiBoton extends StatelessWidget {
  final IconData miIcono;
  final Evento miEventto;
  const MiBoton({
    super.key,
    required this.miIcono,
    required this.miEventto,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        onPressed: () {
          context.read<MiBloc>().add(miEventto);
        },
        child: Icon(miIcono),
      ),
    );
  }
}
