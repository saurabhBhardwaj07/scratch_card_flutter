// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeBlocState extends Equatable {
  final TextEditingController? searchController;
  final int winPrize;
  final int? luckyNumber;

  const HomeBlocState(
      {this.searchController, this.winPrize = 0, this.luckyNumber});

  @override
  List<Object?> get props => [searchController, winPrize, luckyNumber];

  HomeBlocState copyWith(
      {TextEditingController? searchController,
      int? winPrize,
      int? luckyNumber}) {
    return HomeBlocState(
        searchController: searchController ?? this.searchController,
        winPrize: winPrize ?? this.winPrize,
        luckyNumber: luckyNumber);
  }
}
