// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeBlocEvent extends Equatable {}

class HomeBlocInitialEvent extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

class HomeBlocLuckyNumberSubmit extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

class HomeBlocAutoPickNumberSubmit extends HomeBlocEvent {
  final int pickedNumber;
  HomeBlocAutoPickNumberSubmit({
    required this.pickedNumber,
  });
  @override
  List<Object?> get props => [pickedNumber];
}

class HomeBlocClaimAmountEvent extends HomeBlocEvent {
  final int amount;
  HomeBlocClaimAmountEvent({
    required this.amount,
  });

  @override
  List<Object?> get props => [];
}
