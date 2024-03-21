import 'dart:async';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  late TextEditingController searchCtr;

  HomeBloc(HomeBlocState initialState) : super(initialState) {
    on<HomeBlocInitialEvent>(_homeBlocInitialEvent);
    on<HomeBlocLuckyNumberSubmit>(_homeBlocLuckyNumberSubmit);
    on<HomeBlocClaimAmountEvent>(_homeBlocClaimAmountEvent);
    on<HomeBlocAutoPickNumberSubmit>(_homeBlocAutoPickNumberSubmit);
  }

  FutureOr<void> _homeBlocInitialEvent(
      HomeBlocInitialEvent event, Emitter<HomeBlocState> emit) {
    searchCtr = TextEditingController();
    emit(state.copyWith(searchController: searchCtr));
  }

  FutureOr<void> _homeBlocLuckyNumberSubmit(
      HomeBlocLuckyNumberSubmit event, Emitter<HomeBlocState> emit) {
    var number = searchCtr.text;
    if (number.isEmpty) {
    } else {
      int luckyNumber = int.parse(number);
      emit(state.copyWith(luckyNumber: luckyNumber));
    }
  }

  FutureOr<void> _homeBlocAutoPickNumberSubmit(
      HomeBlocAutoPickNumberSubmit event, Emitter<HomeBlocState> emit) {
    searchCtr.text = event.pickedNumber.toString();
    emit(state.copyWith(
        luckyNumber: event.pickedNumber, searchController: searchCtr));
  }

  @override
  void onChange(Change<HomeBlocState> change) {
    log(change.toString());
    super.onChange(change);
  }

  int totalWinPrize = 0;

  FutureOr<void> _homeBlocClaimAmountEvent(
      HomeBlocClaimAmountEvent event, Emitter<HomeBlocState> emit) {
    searchCtr.clear();
    totalWinPrize += event.amount;
    emit(state.copyWith(
        winPrize: totalWinPrize,
        luckyNumber: null,
        searchController: searchCtr));
  }
}
