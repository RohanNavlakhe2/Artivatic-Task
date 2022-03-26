import 'dart:async';

import 'package:artivatic_task/model/home_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeDataLoading()) {
    on<GetHomeData>((event, emit) {
       emit(HomeDataLoading());
    });
  }
}
