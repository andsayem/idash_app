
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        required this.id,
        required this.name,
        required this.email,
        required this.profile_image,
        this.userTypes,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String email;
    String profile_image ;
    dynamic userTypes;
    DateTime createdAt;
    DateTime updatedAt;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profile_image : json["profile_image"] ,
        userTypes: json["user_types"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profile_image" : profile_image ,
        "user_types": userTypes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
