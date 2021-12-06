import 'package:bloc/bloc.dart';
import 'package:trips_app/cubit/app_cubit_states.dart';
import 'package:trips_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({
    required this.data,
  }) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices? data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data!.getPlaces();
      emit(LoadedState(places));
    } catch (e) {}
  }
}
