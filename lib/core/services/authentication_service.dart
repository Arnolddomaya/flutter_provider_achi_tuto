import 'package:provider_architecture/locator.dart';
import 'api.dart';


class AuthenticationService  {
  
  Api _api = locator<Api>();

  Future<bool> login (int userId) async {
    var fetcheduser = await _api.getUserProfile(userId);
    // Check if success
    var hasUser = fetcheduser != null;
    return hasUser;
  }
}