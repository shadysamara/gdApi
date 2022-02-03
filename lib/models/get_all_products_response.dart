class Product {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  Rating rating;
  Product(
      {this.category,
      this.description,
      this.id,
      this.image,
      this.price,
      this.title,
      this.rating});
  Product.fromMap(Map map) {
    this.id = map['id'];
    this.image = map['image'];
    this.category = map['category'];
    this.description = map['description'];
    this.price = map['price'];
    this.title = map['title'];
    this.rating = Rating.fromMap(map['rating']);
  }
}

class Rating {
  num rate;
  int count;
  Rating({this.count, this.rate});
  Rating.fromMap(Map map) {
    this.rate = map['rate'];
    this.count = map['count'];
  }
}
