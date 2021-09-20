class UserModel {
  int statusCode;
  String message;
  Data data;
  bool error;

  UserModel({this.statusCode, this.message, this.data, this.error});

  UserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  int id;
  String userCode;
  String username;
  String email;
  String name;
  Null mobile;
  String dateOfBirth;
  String bloodGroup;
  String dateOfJoin;
  String gender;
  String religion;
  String userImage;
  String branchsName;
  Null branchsCode;
  String departmentsName;
  String designationsName;
  String unitName;
  String sectionName;
  String imageAppUrl;

  Data(
      {this.id,
      this.userCode,
      this.username,
      this.email,
      this.name,
      this.mobile,
      this.dateOfBirth,
      this.bloodGroup,
      this.dateOfJoin,
      this.gender,
      this.religion,
      this.userImage,
      this.branchsName,
      this.branchsCode,
      this.departmentsName,
      this.designationsName,
      this.unitName,
      this.sectionName,
      this.imageAppUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    mobile = json['mobile'];
    dateOfBirth = json['date_of_birth'];
    bloodGroup = json['blood_group'];
    dateOfJoin = json['date_of_join'];
    gender = json['gender'];
    religion = json['religion'];
    userImage = json['user_image'];
    branchsName = json['branchs_name'];
    branchsCode = json['branchs_code'];
    departmentsName = json['departments_name'];
    designationsName = json['designations_name'];
    unitName = json['unit_name'];
    sectionName = json['section_name'];
    imageAppUrl = json['image_app_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_code'] = this.userCode;
    data['username'] = this.username;
    data['email'] = this.email;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['date_of_birth'] = this.dateOfBirth;
    data['blood_group'] = this.bloodGroup;
    data['date_of_join'] = this.dateOfJoin;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['user_image'] = this.userImage;
    data['branchs_name'] = this.branchsName;
    data['branchs_code'] = this.branchsCode;
    data['departments_name'] = this.departmentsName;
    data['designations_name'] = this.designationsName;
    data['unit_name'] = this.unitName;
    data['section_name'] = this.sectionName;
    data['image_app_url'] = this.imageAppUrl;
    return data;
  }
}
