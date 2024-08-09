import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../networking/model/product_model.dart';
import '../../networking/repository/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository res;

  HomeBloc(this.res) : super(HomeInitial()) {
    on<GetListProductsEvent>(getListProducts);
  }

  Future<void> getListProducts(
      GetListProductsEvent event, Emitter<HomeState> emit) async {
      emit(HomeLoading());
    try {
      final value = await res.getListProduct();
      emit(HomeSuccess(listProducts: value, listCartProducts: const []));
    } catch (e) {
      emit(HomeError(e));
    }
  }

  void addCart(
      GetListProductsEvent event, Emitter<HomeState> emit, Product product) {
    if (state is HomeSuccess) {
      final successState = state as HomeSuccess;

      List<Product> listCartProductsNew = successState.listCartProducts;

      //kiểm tra giỏ hàng đã chứa sản phẩm đó hay chưa
      if (!successState.listCartProducts.contains(product)) {
        product.quantityInCart = (product.quantityInCart ?? 0) + 1;
        listCartProductsNew.add(product);
      }

      emit(HomeSuccess(
          listProducts: successState.listProducts,
          listCartProducts: listCartProductsNew));
    }
  }
}
