
class BasicEquipTypeWithSub {
  /// 数据文件基础外层：版本号，列表<Types>
  final int version;
  final List<Types> list;

  BasicEquipTypeWithSub(
    this.version,
    this.list,
  );

  BasicEquipTypeWithSub.fromJson(Map<String, dynamic> json):
    version = json["version"],
    list = json["subs"];

  Map<String, dynamic> toJson() =>
    {
      "version": version,
      "subs": list,
    };

}

class BasicEquipTypeNoSub {
  /// 数据文件外层：版本号，列表<Subs>
  final int version;
  final List<Subs> list;

  BasicEquipTypeNoSub(
    this.version,
    this.list,
  );

  BasicEquipTypeNoSub.fromJson(Map<String, dynamic> json):
    version = json["version"],
    list = json["subs"];

  Map<String, dynamic> toJson() =>
    {
      "version": version,
      "subs": list,
    };

}

class Types {
  /// 上层类型列表：中文名，英文名，子列表<Subs>
  final String nameCh;
  final String nameEn;
  final List<Subs> subs;

  Types(
    this.nameCh,
    this.nameEn,
    this.subs,
  );
  Types.fromJson(Map<String, dynamic> json):
    nameCh = json["nameCh"],
    nameEn = json["nameEn"],
    subs = json["subs"];

  Map<String, dynamic> toJson() =>
    {
      "nameCh": nameCh,
      "nameEn": nameEn,
      "subs": subs,
    };

}

class Subs {
  /// 基础类型列表：中文名，英文名
  final String nameCh;
  final String nameEn;

  Subs(
    this.nameCh,
    this.nameEn,
  );

  Subs.fromJson(Map<String, dynamic> json):
    nameCh = json["nameCh"],
    nameEn = json["nameEn"];

  Map<String, dynamic> toJson() =>
    {
      "nameCh": nameCh,
      "nameEn": nameEn,
    };

}
