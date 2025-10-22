import 'package:couch_social_app/core/data/fake_data.dart';
import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';
import 'package:couch_social_app/features/wall/domain/repo_contracts/friends_repository.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  final FakeData fakeData;

  FriendsRepositoryImpl({required this.fakeData});

  @override
  Future<Result<List<AppUser>>> getFriends(String userId) async {
    try {
      final friends = await fakeData.friends();
      return Result.ok(friends);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
