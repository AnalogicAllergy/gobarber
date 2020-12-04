import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @action
  changeEmail(String value) => email = value;

  @action
  changePassword(String value) => password = value;

  String validateEmail() {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) return "O email informado não é válido!";
    return null;
  }

  String validatePassword() {
    if (password.length < 6) return "Insira uma senha mais forte";
    return null;
  }

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }
}
