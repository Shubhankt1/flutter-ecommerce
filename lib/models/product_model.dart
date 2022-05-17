class Product {
  final String? id;
  final String name;
  final String desc;
  final double price;
  final String imgUrl;

  Product({
    this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap(String docId) {
    return {
      "id": docId,
      "name": name,
      "desc": desc,
      "price": price,
      "imgUrl": imgUrl,
    };
  }

  Product.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? "",
        name = map["name"] ?? "",
        desc = map["desc"] ?? "",
        price = map["price"] ?? 0.0,
        imgUrl = map["imgUrl"] ?? "";
}
