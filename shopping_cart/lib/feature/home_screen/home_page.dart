import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/component/card_product.dart';
import 'package:shopping_cart/component/text.dart';
import 'package:shopping_cart/const/color.dart';
import 'package:shopping_cart/const/size.dart';
import 'package:shopping_cart/networking/repository/product_repository.dart';

import '../../bloc/home/home_bloc.dart';
import '../../networking/model/product_model.dart';
part 'home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc(ProductRepository()),
        child: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetListProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final x = MediaQuery.sizeOf(context).height;
    final y = MediaQuery.sizeOf(context).width;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return switch (state) {
          HomeInitial _ =>
            const Scaffold(body: Center(child: Text('Chờ 1 xíu..'))),
          HomeLoading _ =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
          HomeSuccess _ => _buildScreen(state,x,y),
          HomeError _ => const Text('Có lỗi xảy ra'),
        };
      },
    );
  }
}
