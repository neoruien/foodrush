class Shoppinglist {
  static List<dynamic> shoppingList = [
    'Brown sugar',
    'Apple',
    'White rice',
    'Eggs',
    'Fresh milk'
  ];

  void add(String s) {
    shoppingList.add(s);
  }

  void remove(String s) {
    shoppingList.remove(s);
  }
}