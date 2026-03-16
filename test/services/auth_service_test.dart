import 'package:flutter_test/flutter_test.dart';
import 'package:dummy_project/services/auth_service.dart';

void main() {

  late AuthService authService;

  setUp(() {
    authService = AuthService();
  });

  test("login success", () async {

    final result = await authService.login(
      "samiran@test.com",
      "123456",
    );

    expect(result, true);

  });

  test("login failure", () async {

    final result = await authService.login(
      "wrong",
      "wrong",
    );

    expect(result, false);

  });

}