
class RecipeModel{

  RecipeModel({
    this.appLabel,
    this.appCalories,
    this.appImgUrl,
    this.appUrl,
});

  String? appLabel;
  String? appImgUrl;
  String? appUrl;
  String? appCalories;
  //List<List> recipeList;

  factory RecipeModel.fromMap(Map recipe) {
    return RecipeModel(
      appLabel: recipe['label'],
      appCalories: recipe['calories'].toString(),
      appUrl: recipe['url'],
      appImgUrl: recipe['image'],

    );
  }
}