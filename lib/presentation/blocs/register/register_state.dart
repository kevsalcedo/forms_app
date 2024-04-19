part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  //Aqui elegimos las propiedades que quiero que sean evaluadas para definir si el estado es igual a otro
  List<Object> get props => [ formStatus, isValid, username, email, password ];
}

//final class RegisterInitial extends RegisterState {}
