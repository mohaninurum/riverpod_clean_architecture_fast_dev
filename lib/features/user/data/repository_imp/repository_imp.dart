import 'package:freezed_riverpod_clean_architecture_fast_dev/features/user/data/model/user_model.dart';

import '../../domain/repository/use_repository.dart';
import '../data_sounce/user_datasource.dart';

class RepositoryImp extends UseRepository {
  final UserDatasource userDatasource = UserDatasource();

  @override
  Future<List<UserModel>> getUse() {
    return userDatasource.getUse();
  }
}
