import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../models/support_model.dart';
import '../../core/constants/api_constants.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getUsers(int page) async {
    final response = await _dio
        .get('${ApiConstants.baseUrl}${ApiConstants.users}?page=$page');
    return response.data;
  }

  Future<Map<String, dynamic>> getUserDetails(int userId) async {
    final response = await _dio
        .get('${ApiConstants.baseUrl}${ApiConstants.userDetails}$userId');
    return response.data;
  }
}
