class Api {
  static const String baseUrl =
      'http://jaibharat-test.eba-skr2kpce.ap-south-1.elasticbeanstalk.com/rest/authenticate';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String loginEmail = 'authaccount/login';
}
