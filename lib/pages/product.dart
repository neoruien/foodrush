class Product {
  String thumbnail = '';
  String productName = '';
  double price = 0.0;
  String seller = 'Uncle Tan';
  String description = '';
  String collectionVenue = '';
  DateTime bestBefore;

  Product(this.thumbnail, this.productName, this.price, this.seller,
      this.description, this.collectionVenue, this.bestBefore);
}