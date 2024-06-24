# recipe_app


### Step 1: Add Assets to Your Project
First, ensure that your JSON files are added to your project's `assets` directory. Create this directory if it doesn't exist.

1. Create a directory named `assets` in your project's root.
2. Add your JSON files to this directory. For example, you might have a `recipes.json` file.

### Step 2: Update `pubspec.yaml`
You need to specify the assets in your `pubspec.yaml` file to make them accessible in your app.

```yaml
flutter:
  assets:
    - assets/recipes.json
```

### Step 3: Load JSON Data in Flutter
Use the `rootBundle` to load the JSON file in your Flutter app.

#### Example: Loading Recipes from JSON

1. **Create a model for your recipe data:**

```dart
class Recipe {
  final String name;
  final String ingredients;
  final String instructions;

  Recipe({required this.name, required this.ingredients, required this.instructions});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
    );
  }
}
```

2. **Load the JSON file and parse it:**

```dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<Recipe>> loadRecipes() async {
  final String response = await rootBundle.loadString('assets/recipes.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Recipe.fromJson(json)).toList();
}
```

3. **Use the loaded data in your widget:**

```dart
import 'package:flutter/material.dart';

class RecipesApp extends StatefulWidget {
  @override
  _RecipesAppState createState() => _RecipesAppState();
}

class _RecipesAppState extends State<RecipesApp> {
  late Future<List<Recipe>> recipes;

  @override
  void initState() {
    super.initState();
    recipes = loadRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipes App'),
        ),
        body: FutureBuilder<List<Recipe>>(
          future: recipes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final recipes = snapshot.data!;
              return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return ListTile(
                    title: Text(recipe.name),
                    subtitle: Text('Ingredients: ${recipe.ingredients}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

void main() => runApp(RecipesApp());
```

### Example JSON File (`assets/recipes.json`)
```json
[
  {
    "name": "Spaghetti Carbonara",
    "ingredients": "Spaghetti, Eggs, Parmesan Cheese, Pancetta, Pepper",
    "instructions": "Boil spaghetti. Cook pancetta. Mix eggs and cheese. Combine all with pasta."
  },
  {
    "name": "Chicken Curry",
    "ingredients": "Chicken, Curry Powder, Onion, Garlic, Coconut Milk",
    "instructions": "Cook chicken. Sauté onions and garlic. Add curry powder and coconut milk. Simmer."
  }
]
```

### Summary
1. **Add JSON files to the `assets` directory.**
2. **Update `pubspec.yaml` to include the assets.**
3. **Load the JSON data using `rootBundle.loadString()`.**
4. **Parse the JSON and use it in your widgets.**

By following these steps, you can effectively manage and use JSON assets in your Flutter application, providing a structured and scalable way to handle data like recipes in your app.

### ScreenShorts 

<p align='center'>
  <img src='https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/d1fbc069-cc1d-4708-a539-99fb4f004ee9' width='240'>
  <img src='https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/f8fc2d8d-a401-4328-8e89-542b3fc5f209' width='240'>
  <img src='https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/54c55102-3d63-49ff-9791-e3e20392d59b' width='240'>
  <img src='https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/e1742db6-c58a-4457-be0a-f1b98bef3c35' width='240'>
  <img src='https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/f5ee4da0-3e50-40c3-8c32-6937a14c35c2' width='240'>

</p>

### video
https://github.com/Meshva30/jsonparsing_ecommerce_app/assets/136339359/8d5b2632-6cd3-4954-a7e5-e26bfb696226


