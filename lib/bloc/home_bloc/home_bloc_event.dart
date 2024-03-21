// ignore_for_file: public_member_api_docs, sort_constructors_first

// Importing necessary packages and libraries
part of 'home_bloc.dart';

// Declaring an abstract class for HomeBlocEvent
@immutable
abstract class HomeBlocEvent extends Equatable {}

// Event for initializing the home bloc
class HomeBlocInitialEvent extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

// Event for submitting a lucky number
class HomeBlocLuckyNumberSubmit extends HomeBlocEvent {
  @override
  List<Object?> get props => [];
}

// Event for submitting an auto-picked number
class HomeBlocAutoPickNumberSubmit extends HomeBlocEvent {
  final int pickedNumber;

  // Constructor for HomeBlocAutoPickNumberSubmit event
  HomeBlocAutoPickNumberSubmit({
    required this.pickedNumber,
  });

  @override
  List<Object?> get props => [pickedNumber];
}

// Event for claiming an amount
class HomeBlocClaimAmountEvent extends HomeBlocEvent {
  final int amount;

  // Constructor for HomeBlocClaimAmountEvent event
  HomeBlocClaimAmountEvent({
    required this.amount,
  });

  @override
  List<Object?> get props => [];
}
