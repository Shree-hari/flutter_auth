import 'package:flutterapps/constants/route_names.dart';
import 'package:flutterapps/locator.dart';
import 'package:flutterapps/services/authentication_service.dart';
import 'package:flutterapps/services/navigation_service.dart';
import 'package:flutterapps/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handelStartUpLogic()  async {

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if(hasLoggedInUser){
      _navigationService.navigateTo(HomeViewRoute);
    }else{
      _navigationService.navigateTo(LoginViewRoute);
    }


  }
}