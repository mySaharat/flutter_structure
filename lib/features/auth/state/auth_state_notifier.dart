import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_structure/features/auth/data/api/auth_repository.dart';
import 'auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthStateNotifier(this.repository) : super(const AuthState());

  Future<void> login(String userId, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await repository.login(userId, password);
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {
    state = const AuthState(); // Reset ทั้งหมด
  }
}

// สร้าง Provider สำหรับใช้งานใน UI จะแยกเป็น auth_provider.dart ก็ได้
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
      final repo = ref.watch(authRepositoryProvider);
      return AuthStateNotifier(repo);
    });
