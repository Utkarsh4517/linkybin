part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class TabTappedState extends HomeActionState {
  final String catetory;
  TabTappedState({
    required this.catetory,
  });
  
}
