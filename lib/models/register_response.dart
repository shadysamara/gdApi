class RegisterResponse {
  bool success;
  User data;
  int status;
  String message;

  RegisterResponse(this.success, this.data, this.status, this.message);

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String image;
  String lang;
  String createdAt;
  String accessToken;
  bool verified;
  var verifyToken;
  var point;
  int cancelCount;
  int completeCount;
  int processingCount;
  int pendingCount;
  int ofdCount;
  int unpaidOrderCount;
  int confirmedCount;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.image,
      this.lang,
      this.createdAt,
      this.accessToken,
      this.verified,
      this.verifyToken,
      this.point,
      this.cancelCount,
      this.completeCount,
      this.processingCount,
      this.pendingCount,
      this.ofdCount,
      this.unpaidOrderCount,
      this.confirmedCount});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    lang = json['lang'];
    createdAt = json['created_at'];
    accessToken = json['access_token'];
    verified = json['verified'];
    verifyToken = json['verify_token'];
    point = json['point'];
    cancelCount = json['cancel_count'];
    completeCount = json['complete_count'];
    processingCount = json['processing_count'];
    pendingCount = json['pending_count'];
    ofdCount = json['ofd_count'];
    unpaidOrderCount = json['unpaid_order_count'];
    confirmedCount = json['confirmed_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['lang'] = this.lang;
    data['created_at'] = this.createdAt;
    data['access_token'] = this.accessToken;
    data['verified'] = this.verified;
    data['verify_token'] = this.verifyToken;
    data['point'] = this.point;
    data['cancel_count'] = this.cancelCount;
    data['complete_count'] = this.completeCount;
    data['processing_count'] = this.processingCount;
    data['pending_count'] = this.pendingCount;
    data['ofd_count'] = this.ofdCount;
    data['unpaid_order_count'] = this.unpaidOrderCount;
    data['confirmed_count'] = this.confirmedCount;
    return data;
  }
}
