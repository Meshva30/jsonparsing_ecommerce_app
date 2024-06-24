import 'package:flutter/material.dart';

import '../../model/main_model.dart';

Column productImage(MainModal mainModal, int productIndex) {
  return Column(
    children: [
      Stack(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  mainModal.recipes[productIndex].image,
                ),
              ),
            ),
          ),
        ],
      )
    ],
  );
}
