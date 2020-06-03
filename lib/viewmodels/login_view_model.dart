import 'base_model.dart';
import 'package:flutterapps/constants/route_names.dart';
import 'package:flutterapps/locator.dart';
import 'package:flutterapps/services/authentication_service.dart';
import 'package:flutterapps/services/dialog_service.dart';
import 'package:flutterapps/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
class LoginViewModel extends BaseModel {

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}