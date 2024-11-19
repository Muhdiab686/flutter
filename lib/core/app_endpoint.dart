class EndPoint {
  static const baseUrl = "http://192.168.209.171:8000";
  static const appVersion = "$baseUrl/api";
  static const loginUrl = "$appVersion/login";
  static const registerUrl = "$appVersion/register";
  static const verfiyCodeUrl = "$appVersion/verification";
  static const resendCodeUrl = "$appVersion/resend";
  static const getGroupUrl = "$appVersion/getgroups";
  static const createGroupUrl = "$appVersion/createGroup";
  static const getUserGroupUrl = "$appVersion/getuser";
  static const getFileinGroupUrl = "$appVersion/get_file";
  static const getUser = "$appVersion/get_user";
}
