import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';

class FakeData {
  int _callCount = 0;

  Future<AppUser> user() async {
    await Future.delayed(const Duration(seconds: 1));
    _callCount++;

    // Every other time, throw an exception
    if (_callCount % 2 == 0) {
      throw Exception('Simulated error on call #$_callCount');
    }

    return AppUser(
      id: '1',
      firstName: 'Tomas',
      lastName: 'Baran',
      imageUrl: 'https://nexume.vercel.app/profile_img.png',
    );
  }
}
