import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/repo_contracts/user_repository.dart';
import 'package:flutter/material.dart';
import '../domain/entities/app_user.dart';

class ProfileVM extends ChangeNotifier {
  final UserRepository userRepository;

  AppUser? _user;
  bool _isLoading = false;
  String? _error;

  ProfileVM({required this.userRepository});

  AppUser? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadUser() async {
    _isLoading = true;
    // If loadUsers() is called multiple times, make sure the error is cleared
    _error = null;
    notifyListeners();

    final userResult = await userRepository.getCurrentUser();
    switch (userResult) {
      case Ok(value: final user):
        _user = user;
      case Error(error: final error):
        _error = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
