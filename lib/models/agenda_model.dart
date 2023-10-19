class AgendaModel {
  List<Agenda>? results;

  AgendaModel({
    this.results,
  });

  factory AgendaModel.fromJson(Map<String, dynamic> json) => AgendaModel(
        results:
            List<Agenda>.from(json['results'].map((x) => Agenda.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'results': List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Agenda {
  String objectId = '';
  DateTime? createdAt;
  DateTime? updatedAt;
  String name = '';
  String phoneNumber = '';
  String email = '';
  String imagePath = '';

  Agenda({
    required this.objectId,
    this.createdAt,
    this.updatedAt,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
  });

  Agenda.create({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
  });

  factory Agenda.fromJson(Map<String, dynamic> json) => Agenda(
        objectId: json['objectId'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        imagePath: json['imagePath'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'imagePath': imagePath,
      };
}