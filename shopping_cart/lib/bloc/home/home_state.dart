part of 'home_bloc.dart';

@immutable
sealed class HomeState {
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
   List<Product> listProducts;
   List<Product> listCartProducts;

  HomeSuccess({
    required this.listProducts,
    required this.listCartProducts,
  });
}

final class HomeError extends HomeState {
  final dynamic error;

  HomeError(this.error);
}
