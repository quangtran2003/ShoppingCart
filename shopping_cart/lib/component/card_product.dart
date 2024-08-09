// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shopping_cart/component/text.dart';
import 'package:shopping_cart/const/color.dart';
import 'package:shopping_cart/const/function.dart';
import 'package:shopping_cart/const/size.dart';

import '../networking/model/product_model.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    this.height,
    this.width,
    this.isHotProduct = false,
    required this.product,
  }) : super(key: key);
  final double? height;
  final double? width;
  final bool isHotProduct;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.sizeMedium)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            '${product.image}',
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppSize.sizeSmall, top: AppSize.sizeSmall),
                    child: Image.asset(
                      'assets/fire.png',
                      width: AppSize.sizeBig,
                      height: AppSize.sizeBig,
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      MyText(
                        text: product.name ?? '',
                        fontWeight: FontWeight.bold,
                      ),
                      MyText(
                        text: '${BaseFunc.convertPrice(product.price ?? 0)} đ',
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.sizeSmall),
                    child: Icon(Icons.add_shopping_cart),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
