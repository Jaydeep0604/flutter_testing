class User {
  String firstName;
  String lastName;

  User(this.firstName, this.lastName);

  // Factory constructor to create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['firstName'] ?? '',
      json['lastName'] ?? '',
    );
  }

  // Convert User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  @override
  String toString() {
    return 'User: { firstName: $firstName, lastName: $lastName }';
  }
}