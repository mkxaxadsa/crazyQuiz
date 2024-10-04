part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CoinsLoadedState extends HomeState {
  final int coins;
  CoinsLoadedState({required this.coins});
}
