class RegisterRequest {
  String email;
  String password;
  String phone;
  String first_name;
  String last_name;
  String fcm_token;
  String device_type;
  RegisterRequest(
      {this.device_type,
      this.email,
      this.fcm_token,
      this.first_name,
      this.last_name,
      this.password,
      this.phone});
  toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'phone': this.phone,
      'first_name': this.first_name,
      'last_name': this.last_name,
      'fcm_token': this.fcm_token = 'fcm_token',
      'device_type': this.device_type = 'android'
    };
  }
}
