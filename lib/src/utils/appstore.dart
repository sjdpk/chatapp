import 'package:mobx/mobx.dart';
part 'appstore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setLoading({required bool loading}) {
    isLoading = loading;
  }

  @observable
  bool show = false;

  @action
  void setShow(bool? show) {
    this.show = show ?? false;
  }

  @observable
  int initialLine = 1;

  @action
  void setinitialLine({int? line}) {
    initialLine = line ?? 1;
  }

  @observable
  bool isLogin = true;

  @action
  void setLogin() {
    isLogin = !isLogin;
  }
}
