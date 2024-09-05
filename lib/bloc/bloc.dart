import 'package:bloc/bloc.dart';
import 'package:usando_bloc_appcontador/bloc/estado.dart';
import 'package:usando_bloc_appcontador/bloc/evento.dart';
import 'package:usando_bloc_appcontador/constantes.dart';

class MiBloc extends Bloc<Evento, Estado> {
  MiBloc() : super(Estado(numero: 0)) {
    on<Incrementar>((event, emit) {
      int n = state.numero;
      n = n + event.enCuanto;
      imagenes.containsKey(n)
          ? emit(stateImagen(url: imagenes[n].toString(), numero: n))
          : emit(Estado(numero: n));
    });

    on<Decrementar>((event, emit) {
      int n = state.numero;
      n = n - event.enCuanto;
      emit(Estado(numero: n));
    });
  }
}
