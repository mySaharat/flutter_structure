import 'package:flutter_structure/features/auth/data/model/auth_model.dart';

class AuthState {
  final bool isLoading;
  final AuthModel? user;
  final String? error;

  const AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, AuthModel? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}
