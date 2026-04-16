import 'package:recepies_app/services/http_service.dart';
import '../models/user.dart';

class AuthService {

  // Always have a single instance of this class throughout its lifecycle
  static final AuthService _singleton = AuthService._internal();

  final _httpService = HTTPService();

  User? user;

  factory AuthService(){
    return _singleton;
  }

  AuthService._internal(); // Cosntructor

  Future<bool> login(String username, String password) async {
    try {
      var response = await _httpService.post("auth/login", {
       "username": username,
       "password": password, 
      });
      // print(response?.statusCode);
            // return response;
      if(response?.statusCode == 200 && response?.data != null){
        user = User.fromJson(response!.data);
        HTTPService().setup(bearerToken: user!.accessToken);
        return true;
      }
      else{
        print("There is no response from API server");
        print(response!.statusMessage);
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

}