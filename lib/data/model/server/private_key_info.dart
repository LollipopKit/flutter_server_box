import 'dart:convert';

///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class PrivateKeyInfo {
/*
{
  "id": "",
  "private_key": "",
  "password": ""
} 
*/

  late String id;
  late String privateKey;
  late String password;

  PrivateKeyInfo(
    this.id,
    this.privateKey,
    this.password,
  );
  PrivateKeyInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    privateKey = json["private_key"].toString();
    password = json["password"].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["private_key"] = privateKey;
    data["password"] = password;
    return data;
  }
}

List<PrivateKeyInfo> getPrivateKeyInfoList(dynamic data) {
  List<PrivateKeyInfo> ss = [];
  if (data is String) {
    data = json.decode(data);
  }
  for (var t in data) {
    ss.add(PrivateKeyInfo.fromJson(t));
  }

  return ss;
}
