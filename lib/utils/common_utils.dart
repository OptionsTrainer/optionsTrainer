class CommonUtils {
  const CommonUtils();

  //email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  //password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6 || value.length > 10) {
      return 'Password must be 6–10 characters long';
    }
    /*final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>~]).+$'
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Password is required';
    }*/

    return null;
  }

  //name validator
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }

    if (value.length < 3 || value.length > 20) {
      return 'Name must be at-least 3 characters long';
    }

    return null;
  }



}
