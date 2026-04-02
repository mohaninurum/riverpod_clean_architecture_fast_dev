
import '../../../../network/api_endpoints.dart';
import '../../../../network/api_service.dart';
import '../model/user_model.dart';

class UserDatasource {
  final ApiService apiService = ApiService();

  Future<List<UserModel>> getUse() async {
    final data = await apiService.get(ApiEndpoints.todos);

    return (data as List)
        .map((e) => UserModel(
      name: e['title'],
      email: e['id'].toString(),
    ))
        .toList();
  }
}