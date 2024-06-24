
import 'package:flutter/material.dart';

import '../../model/main_model.dart';



Padding instructinos(MainModal mainModal,int productIndex) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Instructions',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Divider(
          // thickness: ,
        ),

        SizedBox(
          height: 7,
        ),
        ...List.generate(
          mainModal.recipes[productIndex].instructions.length,
              (index) {
            return Text(
              '-  ${mainModal.recipes[productIndex].instructions[index]}',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            );
          },
        )
      ],
    ),
  );
}
