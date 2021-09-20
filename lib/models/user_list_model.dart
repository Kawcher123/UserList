class UserListModel {
  int statusCode;
  String message;
  List<UserData> data;
  bool error;

  UserListModel({this.statusCode, this.message, this.data, this.error});

  UserListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<UserData>();
      json['data'].forEach((v) {
        data.add(new UserData.fromJson(v));
      });
    }
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    return data;
  }
}

class UserData {
  int id;
  String username;
  String userCode;
  String name;
  String email;
  String mobile;
  String bloodGroup;
  String userImage;
  String branchsName;
  Null branchsCode;
  String departmentsName;
  String designationsName;
  String unitName;
  String sectionName;
  String createdAt;
  String status;
  String imageAppUrl;

  UserData(
      {this.id,
      this.username,
      this.userCode,
      this.name,
      this.email,
      this.mobile,
      this.bloodGroup,
      this.userImage,
      this.branchsName,
      this.branchsCode,
      this.departmentsName,
      this.designationsName,
      this.unitName,
      this.sectionName,
      this.createdAt,
      this.status,
      this.imageAppUrl});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    bloodGroup = json['blood_group'];
    userImage = json['user_image'];
    branchsName = json['branchs_name'];
    branchsCode = json['branchs_code'];
    departmentsName = json['departments_name'];
    designationsName = json['designations_name'];
    unitName = json['unit_name'];
    sectionName = json['section_name'];
    createdAt = json['created_at'];
    status = json['status'];
    imageAppUrl = json['image_app_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['user_code'] = this.userCode;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['blood_group'] = this.bloodGroup;
    data['user_image'] = this.userImage;
    data['branchs_name'] = this.branchsName;
    data['branchs_code'] = this.branchsCode;
    data['departments_name'] = this.departmentsName;
    data['designations_name'] = this.designationsName;
    data['unit_name'] = this.unitName;
    data['section_name'] = this.sectionName;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    data['image_app_url'] = this.imageAppUrl;
    return data;
  }
}
