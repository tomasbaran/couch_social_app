import 'package:couch_social_app/core/data/fake_data.dart';
import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';
import 'package:couch_social_app/features/profile/domain/repo_contracts/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FakeData fakeData;

  UserRepositoryImpl({required this.fakeData});

  @override
  Future<Result<AppUser>> getCurrentUser() async {
    try {
      final user = await fakeData.user();
      return Result.ok(user);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
