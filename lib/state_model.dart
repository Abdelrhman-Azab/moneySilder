class StateModel {
  int? id;
  String? name;
  String? iso;
  StateModel({required this.id, required this.name, required this.iso});

  StateModel.fromjson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    iso = map['iso2'];
  }
}
