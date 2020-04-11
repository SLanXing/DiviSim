class EquipBasicTypeBean {
  final String nameCh;
  final String nameEn;

  EquipBasicTypeBean({this.nameCh, this.nameEn});

  factory EquipBasicTypeBean.fromJson(Map<String, dynamic> json) {
    return EquipBasicTypeBean(nameCh: json["name_ch"], nameEn: json["name_en"]);
  }
}

class EquipFileTypeBean {
  final List<EquipBasicTypeBean> subs;
  final int version;

  EquipFileTypeBean({this.version, this.subs});

    factory EquipFileTypeBean.fromJson(Map<String, dynamic> json) {
      return EquipFileTypeBean(version: json["version"], subs: json["subs"]);
    }
}