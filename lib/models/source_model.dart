class SourceModel {
  String id;
  String name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJason(Map<String, dynamic> jason) => SourceModel(
        id: jason["id"],
        name: jason["name"],
      );
}
