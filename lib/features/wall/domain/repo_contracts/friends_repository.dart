import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';

abstract class FriendsRepository {
  Future<Result<List<AppUser>>> getFriends(String userId);
}
