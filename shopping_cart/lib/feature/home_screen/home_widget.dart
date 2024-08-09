part of 'home_page.dart';

Widget _buildScreen(HomeSuccess state, double height, double width) {
  final List<Product> listHotProduct =
      state.listProducts.where((product) => product.isHot == true).toList();
  final List<Product> listNotHotProduct =
      state.listProducts.where((product) => product.isHot == false).toList();

  return Scaffold(
    body: Container(
      height: height,
      child: Column(
        children: [
          _buildAppBar(state),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'HOT Products',
                      color: AppColors.secondColor,
                      fontSize: AppSize.sizeBig,
                      fontWeight: FontWeight.bold,
                    ),
                    Image.asset(
                      'assets/fire.gif',
                      width: AppSize.sizeBigest,
                      height: AppSize.sizeBigest,
                    )
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listHotProduct.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CardProduct(
                          product: listHotProduct[index],
                          height: height / 3.5,
                          width: width / 3,
                        );
                      }),
                )
              ],
            ),
          ),
          const Expanded(
            child: Column(),
            flex: 2,
          )
        ],
      ),
    ),

    // body:
    // ListView.builder(
    //   itemCount: state.listProducts.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(state.listProducts[index].name ?? ''),
    //       subtitle: Text(state.listProducts[index].price.toString()),
    //     );
    //   },
    // ),
  );
}

AppBar _buildAppBar(HomeSuccess state) {
  return AppBar(
    title: MyText(text: 'Home'),
    elevation: 0.5,
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: badges.Badge(
            position: badges.BadgePosition.bottomStart(),
            badgeContent: MyText(
              text: state.listCartProducts.length.toString(),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.whiteColor,
            )),
      )
    ],
  );
}
