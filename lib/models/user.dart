class User {
    String accessToken;
    String refreshToken;
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;

    User({
        required this.accessToken,
        required this.refreshToken,
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
    });

    User copyWith({
        String? accessToken,
        String? refreshToken,
        int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
    }) => 
        User(
            accessToken: accessToken ?? this.accessToken,
            refreshToken: refreshToken ?? this.refreshToken,
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            gender: gender ?? this.gender,
            image: image ?? this.image,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
    };
}
