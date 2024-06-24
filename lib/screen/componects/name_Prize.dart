import 'package:flutter/material.dart';

import '../../model/main_model.dart';

Center name_Prize(MainModal mainModal, int productIndex) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 830,
            width: 420,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0xffFEFEFE)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mainModal.recipes[productIndex].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.local_fire_department_outlined,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${mainModal.recipes[productIndex].prepTimeMinutes} Time.',
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.access_time,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(
                      '${mainModal.recipes[productIndex].prepTimeMinutes} Min.',
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    Text(
                      '${mainModal.recipes[productIndex].rating}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(${mainModal.recipes[productIndex].reviewCount} Reviews)',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            '02',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '+',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ...List.generate(
                  mainModal.recipes[productIndex].ingredients.length,
                      (index) {
                    return Text(
                      '-  ${mainModal.recipes[productIndex].ingredients[index]}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...List.generate(
                  mainModal.recipes[productIndex].instructions.length,
                      (index) {
                    return Text(
                      '-  ${mainModal.recipes[productIndex].instructions[index]}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Cuisine : -' ,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].cuisine,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Difficulty : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].difficulty,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Cook Time Minutes : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].cookTimeMinutes.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Prep Time Minutes : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].prepTimeMinutes.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Servings : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].servings.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Rating : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].rating.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Review Count : - ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      mainModal.recipes[productIndex].reviewCount.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
