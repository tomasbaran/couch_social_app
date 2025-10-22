import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/wall/domain/entities/app_post.dart';

abstract class WallRepository {
  Future<Result<List<AppPost>>> getPosts();
}
