class AuthErrors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return "Email já está em uso na aplicação. Tente redefinir a senha!";
      case 'ERROR_INVALID_EMAIL':
        return "Email inválido inserido";
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return "Por gentileza, tente com outro email";
      case 'ERROR_NETWORK_REQUEST_FAILED':
        return "Por gentileza, verifique sua conexão de rede.";
      case 'ERROR_WRONG_PASSWORD':
        return "Sua senha está incorreta";
      case 'ERROR_USER_NOT_FOUND':
        return "Não foi possível encontrar um usuário com esse email";
      default:
        return "An error has occurred";
    }
  }
}
