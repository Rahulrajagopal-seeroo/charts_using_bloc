import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/chart_data.dart';
import '../../../models/payment_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<ChangeYear>(_onChangeYear);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    final chartData = await ChartData.getChartData('2023');
    emit(HomeLoaded(
        selectedYear: '2023',
        chartData: chartData,));
  }

  void _onChangeYear(ChangeYear event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      final chartData = await ChartData.getChartData(event.year);
      emit(HomeLoaded(
          selectedYear: event.year,
          chartData: chartData,));
    }
  }
}
