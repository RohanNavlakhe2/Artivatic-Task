part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeDataLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeDataSuccess extends HomeState{

  HomeDataSuccess(this.homeData);

  final HomeData homeData;

  @override
  List<Object?> get props => [homeData];

}

class HomeDataError extends HomeState{
  @override
  List<Object?> get props => [];
}
