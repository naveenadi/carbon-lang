// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

fn F() -> i32 {
  var n: i32 = 0;
  var p: i32* = &n;

  return *p;
}

// CHECK:STDOUT: --- basic.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Int32: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: Int32 = struct_value () [template]
// CHECK:STDOUT:   %F: type = fn_type @F [template]
// CHECK:STDOUT:   %struct.2: F = struct_value () [template]
// CHECK:STDOUT:   %.2: i32 = int_literal 0 [template]
// CHECK:STDOUT:   %.3: type = ptr_type i32 [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = %Core
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core: <namespace> = namespace [template] {}
// CHECK:STDOUT:   %import_ref.1: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %F.decl: F = fn_decl @F [template = constants.%struct.2] {
// CHECK:STDOUT:     %int.make_type_32: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc7_11.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:     %.loc7_11.2: type = converted %int.make_type_32, %.loc7_11.1 [template = i32]
// CHECK:STDOUT:     @F.%return: ref i32 = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref.2: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.3: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F() -> i32 {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %int.make_type_32.loc8: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc8_10.1: type = value_of_initializer %int.make_type_32.loc8 [template = i32]
// CHECK:STDOUT:   %.loc8_10.2: type = converted %int.make_type_32.loc8, %.loc8_10.1 [template = i32]
// CHECK:STDOUT:   %n.var: ref i32 = var n
// CHECK:STDOUT:   %n: ref i32 = bind_name n, %n.var
// CHECK:STDOUT:   %.loc8_16: i32 = int_literal 0 [template = constants.%.2]
// CHECK:STDOUT:   assign %n.var, %.loc8_16
// CHECK:STDOUT:   %int.make_type_32.loc9: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc9_13.1: type = value_of_initializer %int.make_type_32.loc9 [template = i32]
// CHECK:STDOUT:   %.loc9_13.2: type = converted %int.make_type_32.loc9, %.loc9_13.1 [template = i32]
// CHECK:STDOUT:   %.loc9_13.3: type = ptr_type i32 [template = constants.%.3]
// CHECK:STDOUT:   %p.var: ref i32* = var p
// CHECK:STDOUT:   %p: ref i32* = bind_name p, %p.var
// CHECK:STDOUT:   %n.ref: ref i32 = name_ref n, %n
// CHECK:STDOUT:   %.loc9_17: i32* = addr_of %n.ref
// CHECK:STDOUT:   assign %p.var, %.loc9_17
// CHECK:STDOUT:   %p.ref: ref i32* = name_ref p, %p
// CHECK:STDOUT:   %.loc11_11: i32* = bind_value %p.ref
// CHECK:STDOUT:   %.loc11_10.1: ref i32 = deref %.loc11_11
// CHECK:STDOUT:   %.loc11_10.2: i32 = bind_value %.loc11_10.1
// CHECK:STDOUT:   return %.loc11_10.2
// CHECK:STDOUT: }
// CHECK:STDOUT:
