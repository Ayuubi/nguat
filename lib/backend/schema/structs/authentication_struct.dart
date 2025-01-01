// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthenticationStruct extends FFFirebaseStruct {
  AuthenticationStruct({
    double? username,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _username = username,
        super(firestoreUtilData);

  // "username" field.
  double? _username;
  double get username => _username ?? 0.0;
  set username(double? val) => _username = val;

  void incrementUsername(double amount) => username = username + amount;

  bool hasUsername() => _username != null;

  static AuthenticationStruct fromMap(Map<String, dynamic> data) =>
      AuthenticationStruct(
        username: castToType<double>(data['username']),
      );

  static AuthenticationStruct? maybeFromMap(dynamic data) => data is Map
      ? AuthenticationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'username': _username,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static AuthenticationStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'AuthenticationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthenticationStruct && username == other.username;
  }

  @override
  int get hashCode => const ListEquality().hash([username]);
}

AuthenticationStruct createAuthenticationStruct({
  double? username,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthenticationStruct(
      username: username,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthenticationStruct? updateAuthenticationStruct(
  AuthenticationStruct? authentication, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authentication
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthenticationStructData(
  Map<String, dynamic> firestoreData,
  AuthenticationStruct? authentication,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authentication == null) {
    return;
  }
  if (authentication.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authentication.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authenticationData =
      getAuthenticationFirestoreData(authentication, forFieldValue);
  final nestedData =
      authenticationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authentication.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthenticationFirestoreData(
  AuthenticationStruct? authentication, [
  bool forFieldValue = false,
]) {
  if (authentication == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authentication.toMap());

  // Add any Firestore field values
  authentication.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthenticationListFirestoreData(
  List<AuthenticationStruct>? authentications,
) =>
    authentications
        ?.map((e) => getAuthenticationFirestoreData(e, true))
        .toList() ??
    [];
