import 'package:get/get.dart';
import 'package:getx_practice/models/home/user_list_model.dart';
import 'package:getx_practice/repository/home_repository/home_repository.dart';

import '../../../data/response/status.dart';

class HomeViewModel extends GetxController
{

  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = "".obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void UserListApi(){
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}