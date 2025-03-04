class ContactModel {
  int? id, number, favorite;
  String? name, email, category;

  ContactModel({
    this.id,
    required this.category,
    required this.email,
    required this.favorite,
    required this.name,
    required this.number,
  });

  factory ContactModel.fromMap(Map m1) => ContactModel(
    id: m1['id'],
    category: m1['category'],
    email: m1['email'],
    favorite: m1['favorite'],
    name: m1['name'],
    number: m1['number'],
  );

  static Map<String, Object?> toMap(ContactModel model) {
    return {
      'id': model.id,
      'name': model.name,
      'favorite': model.favorite,
      'email': model.email,
      'category': model.category,
      'number': model.number,
    };
  }
}
