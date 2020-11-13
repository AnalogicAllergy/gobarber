import 'package:mobx/mobx.dart';
part 'register_user_store.g.dart';

class RegisterUserStore = _RegisterUserStoreBase with _$RegisterUserStore;

abstract class _RegisterUserStoreBase with Store {
  @observable
  String name = '';
  @action
  changeName(String value) => name = value;
  @observable
  String email = '';
  changeEmail(String value) => email = value;
  @observable
  String password = '';
  changePassword(String value) => password = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null &&
        validateName() == null &&
        validatePassword() == null;
  }

  String validateName() {
    if (name.length < 2) return "O nome deve ter pelo menos dois caracteres";
    if (name.isEmpty) return "Deve ser informado um nome de usuário";
    return null;
  }

  String validateEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!emailValid) return "O email informado não é válido!";
    return null;
  }

  String validatePassword() {
    if (password.length < 6) return "Insira uma senha mais forte";
    return null;
  }
}
