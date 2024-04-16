part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class TabTappedEvent extends HomeEvent {
  final String category;
  TabTappedEvent({
    required this.category,
  });
}
