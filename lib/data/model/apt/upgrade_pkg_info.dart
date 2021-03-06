import 'package:toolbox/data/model/distribution.dart';

class UpgradePkgInfo {
  final String _raw;
  final Distribution _dist;

  late String package;
  late String nowVersion;
  late String newVersion;
  late String arch;

  UpgradePkgInfo(this._raw, this._dist) {
    switch (_dist) {
      case Distribution.debian:
      case Distribution.unknown:
        _parseApt();
        break;
      case Distribution.rehl:
        _parseYum();
    }
  }

  void _parseApt() {
    final split1 = _raw.split("/");
    package = split1[0];
    final split2 = split1[1].split(" ");
    newVersion = split2[1];
    arch = split2[2];
    nowVersion = split2[5].replaceFirst(']', '');
  }

  void _parseYum() {
    final result = RegExp(r'\S+').allMatches(_raw);
    final pkgAndArch = result.elementAt(0).group(0) ?? '.';
    final split1 = pkgAndArch.split('.');
    package = split1[0];
    arch = split1[1];
    newVersion = result.elementAt(1).group(0) ?? 'Unknown';
    nowVersion = '';
  }
}
