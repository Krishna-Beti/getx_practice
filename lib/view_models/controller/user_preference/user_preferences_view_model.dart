import 'package:getx_practice/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{

  Future<bool> saveUser(UserModel loginResponseModel)
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", loginResponseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    return UserModel(token: token);
  }

  Future<bool> removeUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    return true;
  }
}