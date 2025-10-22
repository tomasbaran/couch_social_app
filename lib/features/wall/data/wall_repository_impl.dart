import 'package:couch_social_app/core/data/fake_data.dart';
import 'package:couch_social_app/core/utils/result.dart';
import 'package:couch_social_app/features/wall/domain/entities/app_post.dart';
import 'package:couch_social_app/features/wall/domain/repo_contracts/wall_repository.dart';

class WallRepositoryImpl implements WallRepository {
  final FakeData fakeData;

  WallRepositoryImpl({required this.fakeData});

  @override
  Future<Result<List<AppPost>>> getPosts() async {
    try {
      final posts = await fakeData.posts();
      return Result.ok(posts);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
