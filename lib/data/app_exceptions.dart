class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(
          message,
          '',
        );
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]) : super(message, '');
}

class InValidInputException extends AppExceptions {
  InValidInputException([String? message])
      : super(message, '');
}
