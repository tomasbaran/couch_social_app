import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/profile/domain/entities/app_user.dart';

abstract class UserRepository {
  Future<Result<AppUser>> getCurrentUser();
}
