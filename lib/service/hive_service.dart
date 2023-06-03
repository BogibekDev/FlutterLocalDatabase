import 'package:hive/hive.dart';
import 'package:local_database/model/account.dart';
import 'package:local_database/model/user.dart';

class HiveService {
  static final _box = Hive.box('local.db');

  static void storeUser(User user) async {
    _box.put('user', user.toJson());
  }

  static User loadUser() {
    return User.fromJson(_box.get('user'));
  }

  static deleteUser() {
    _box.delete('user');
  }

  static void storeAccount(Account account) async {
    _box.put('account', account.toJson());
  }

  static Account loadAccount() {
    return Account.fromJson(_box.get('account'));
  }

  static deleteAccount() {
    _box.delete('account');
  }
}
