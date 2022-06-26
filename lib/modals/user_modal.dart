import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  const User({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
      ];
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    final name = reader.readString();
    final email = reader.readString();
    final password = reader.readString();
    final phoneNumber = reader.readString();
    return User(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeString(obj.password);
    writer.writeString(obj.phoneNumber);
  }
}
