class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeout extends AppExceptions {
  RequestTimeout([String? message]) : super(message, "Request Time out");
}

class InvalidUrl extends AppExceptions {
  InvalidUrl([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Error while communication");
}