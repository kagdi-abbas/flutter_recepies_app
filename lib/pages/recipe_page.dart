import 'package:flutter/material.dart';
import 'package:recepies_app/models/recipe.dart';

class RecipePage extends StatelessWidget{
  final Recipe recipe;

  RecipePage({
    required this.recipe,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: const Text(
          "recipeBook", 
        ),
      ),
      body: _buildUI(context, ),
    );
  }

  Widget _buildUI(BuildContext context,){
    return SingleChildScrollView(
      child: Column(
        children: [
          _recipeImage(context, ),
          _recipeDetails(context, ),
          _recipeIngredients(context, ),
          _recipeInstructions(context, ),
        ],
      ),
    );
  }

  Widget _recipeImage(BuildContext context){
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            recipe.image, 
          ),
        ),
      ),
    );
  }

  Widget _recipeDetails(BuildContext context){
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${recipe.cuisine}, ${recipe.difficulty}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            recipe.name,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Prep Time: ${recipe.prepTimeMinutes} Minutes | Cook Time:  ${recipe.cookTimeMinutes} Minutes",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "Rating: ${recipe.rating.toString()} ⭐ | Review Count:  ${recipe.reviewCount} Reviews",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipeIngredients(BuildContext context, ){
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: 
          recipe.ingredients.map((i) { return Row(
              children: [
                const Icon(
                  Icons.check_box,
                ),
                Text(" $i"),
              ],
            );
          },
        ).toList(

        ),
      ),
    );
  }

  Widget _recipeInstructions(BuildContext context){
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe.instructions.map((i) {
          return Text(
            "${(recipe.instructions.indexOf(i) + 1)}. $i\n",
            maxLines: 3,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 15.0,
            ),
          );
        }).toList(

        ),
      ),
    );
  }
}