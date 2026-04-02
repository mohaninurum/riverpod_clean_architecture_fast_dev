import 'package:freezed_riverpod_clean_architecture_fast_dev/features/user/data/model/user_model.dart';

abstract class UseRepository {


  Future<List<UserModel>> getUse();

}