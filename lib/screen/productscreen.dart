import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonparsing_ecommerce_app/screen/componects/productimg.dart';

import '../model/main_model.dart';

import 'componects/bottomnavigation.dart';
import 'componects/ingredients.dart';

import 'componects/instructinos.dart';
import 'componects/name_Prize.dart';


class ProductScreen extends StatelessWidget {
  ProductScreen(
      {super.key, required this.mainModal, required this.productIndex});

  MainModal mainModal;
  int productIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productImage(mainModal, productIndex),
              name_Prize(mainModal, productIndex),

            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
