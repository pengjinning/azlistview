/*
 * @Author: jack ning github@bytedesk.com
 * @Date: 2024-09-13 11:23:38
 * @LastEditors: jack ning github@bytedesk.com
 * @LastEditTime: 2024-09-13 12:12:34
 * @FilePath: /azlistview/lib/src/az_common.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
/// ISuspension Bean.
abstract class ISuspensionBean {
  bool isShowSuspension = false;

  String getSuspensionTag(); //Suspension Tag
}

/// Suspension Util.
class SuspensionUtil {
  /// sort list by suspension tag.
  /// 根据[A-Z]排序。
  static void sortListBySuspensionTag(List<ISuspensionBean>? list) {
    if (list == null || list.isEmpty) return;
    list.sort((a, b) {
      if (a.getSuspensionTag() == "@" || b.getSuspensionTag() == "#") {
        return -1;
      } else if (a.getSuspensionTag() == "#" || b.getSuspensionTag() == "@") {
        return 1;
      } else {
        return a.getSuspensionTag().compareTo(b.getSuspensionTag());
      }
    });
  }

  /// get index data list by suspension tag.
  /// 获取索引列表。
  static List<String> getTagIndexList(List<ISuspensionBean>? list) {
    List<String> indexData = [];
    if (list != null && list.isNotEmpty) {
      String? tempTag;
      for (int i = 0, length = list.length; i < length; i++) {
        String tag = list[i].getSuspensionTag();
        if (tempTag != tag) {
          indexData.add(tag);
          tempTag = tag;
        }
      }
    }
    return indexData;
  }

  /// set show suspension status.
  /// 设置显示悬停Header状态。
  static void setShowSuspensionStatus(List<ISuspensionBean>? list) {
    if (list == null || list.isEmpty) return;
    String? tempTag;
    for (int i = 0, length = list.length; i < length; i++) {
      String tag = list[i].getSuspensionTag();
      if (tempTag != tag) {
        tempTag = tag;
        list[i].isShowSuspension = true;
      } else {
        list[i].isShowSuspension = false;
      }
    }
  }
}
