

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/model/user_model.dart';
import '../../data/repository_imp/repository_imp.dart';


final userProvider= Provider((ref) {
  return  RepositoryImp();
},);

final userListProvider = FutureProvider<List<UserModel>>((ref) async {
  final repo = ref.watch(userProvider);
  return repo.getUse();
});
