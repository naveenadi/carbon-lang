// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

var x: {.a: i32, .b: (i32,)} = {.a = 1, .b = (2,)};
var y: {.a: i32, .b: (i32,)} = x;

// CHECK:STDOUT: --- tuple_as_element.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Int32: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: Int32 = struct_value () [template]
// CHECK:STDOUT:   %.2: type = tuple_type (type) [template]
// CHECK:STDOUT:   %.3: type = tuple_type (i32) [template]
// CHECK:STDOUT:   %.4: type = struct_type {.a: i32, .b: (i32,)} [template]
// CHECK:STDOUT:   %.5: type = ptr_type {.a: i32, .b: (i32,)} [template]
// CHECK:STDOUT:   %.6: i32 = int_literal 1 [template]
// CHECK:STDOUT:   %.7: i32 = int_literal 2 [template]
// CHECK:STDOUT:   %tuple: (i32,) = tuple_value (%.7) [template]
// CHECK:STDOUT:   %struct.2: {.a: i32, .b: (i32,)} = struct_value (%.6, %tuple) [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = %Core
// CHECK:STDOUT:     .x = %x
// CHECK:STDOUT:     .y = %y
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core: <namespace> = namespace [template] {}
// CHECK:STDOUT:   %import_ref.1: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc7_13: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc7_13.1: type = value_of_initializer %int.make_type_32.loc7_13 [template = i32]
// CHECK:STDOUT:   %.loc7_13.2: type = converted %int.make_type_32.loc7_13, %.loc7_13.1 [template = i32]
// CHECK:STDOUT:   %import_ref.2: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc7_23: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc7_27.1: (type,) = tuple_literal (%int.make_type_32.loc7_23)
// CHECK:STDOUT:   %.loc7_27.2: type = value_of_initializer %int.make_type_32.loc7_23 [template = i32]
// CHECK:STDOUT:   %.loc7_27.3: type = converted %int.make_type_32.loc7_23, %.loc7_27.2 [template = i32]
// CHECK:STDOUT:   %.loc7_27.4: type = converted %.loc7_27.1, constants.%.3 [template = constants.%.3]
// CHECK:STDOUT:   %.loc7_28: type = struct_type {.a: i32, .b: (i32,)} [template = constants.%.4]
// CHECK:STDOUT:   %x.var: ref {.a: i32, .b: (i32,)} = var x
// CHECK:STDOUT:   %x: ref {.a: i32, .b: (i32,)} = bind_name x, %x.var
// CHECK:STDOUT:   %import_ref.3: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc8_13: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc8_13.1: type = value_of_initializer %int.make_type_32.loc8_13 [template = i32]
// CHECK:STDOUT:   %.loc8_13.2: type = converted %int.make_type_32.loc8_13, %.loc8_13.1 [template = i32]
// CHECK:STDOUT:   %import_ref.4: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc8_23: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc8_27.1: (type,) = tuple_literal (%int.make_type_32.loc8_23)
// CHECK:STDOUT:   %.loc8_27.2: type = value_of_initializer %int.make_type_32.loc8_23 [template = i32]
// CHECK:STDOUT:   %.loc8_27.3: type = converted %int.make_type_32.loc8_23, %.loc8_27.2 [template = i32]
// CHECK:STDOUT:   %.loc8_27.4: type = converted %.loc8_27.1, constants.%.3 [template = constants.%.3]
// CHECK:STDOUT:   %.loc8_28: type = struct_type {.a: i32, .b: (i32,)} [template = constants.%.4]
// CHECK:STDOUT:   %y.var: ref {.a: i32, .b: (i32,)} = var y
// CHECK:STDOUT:   %y: ref {.a: i32, .b: (i32,)} = bind_name y, %y.var
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc7_38: i32 = int_literal 1 [template = constants.%.6]
// CHECK:STDOUT:   %.loc7_47: i32 = int_literal 2 [template = constants.%.7]
// CHECK:STDOUT:   %.loc7_49.1: (i32,) = tuple_literal (%.loc7_47)
// CHECK:STDOUT:   %.loc7_50.1: {.a: i32, .b: (i32,)} = struct_literal (%.loc7_38, %.loc7_49.1)
// CHECK:STDOUT:   %.loc7_50.2: ref i32 = struct_access file.%x.var, element0
// CHECK:STDOUT:   %.loc7_50.3: init i32 = initialize_from %.loc7_38 to %.loc7_50.2 [template = constants.%.6]
// CHECK:STDOUT:   %.loc7_50.4: ref (i32,) = struct_access file.%x.var, element1
// CHECK:STDOUT:   %.loc7_49.2: init (i32,) = tuple_init (%.loc7_47) to %.loc7_50.4 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc7_50.5: init (i32,) = converted %.loc7_49.1, %.loc7_49.2 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc7_50.6: init (i32,) = initialize_from %.loc7_50.5 to %.loc7_50.4 [template = constants.%tuple]
// CHECK:STDOUT:   %.loc7_50.7: init {.a: i32, .b: (i32,)} = struct_init (%.loc7_50.3, %.loc7_50.6) to file.%x.var [template = constants.%struct.2]
// CHECK:STDOUT:   %.loc7_51: init {.a: i32, .b: (i32,)} = converted %.loc7_50.1, %.loc7_50.7 [template = constants.%struct.2]
// CHECK:STDOUT:   assign file.%x.var, %.loc7_51
// CHECK:STDOUT:   %x.ref: ref {.a: i32, .b: (i32,)} = name_ref x, file.%x
// CHECK:STDOUT:   %.loc8_32.1: ref i32 = struct_access %x.ref, element0
// CHECK:STDOUT:   %.loc8_32.2: i32 = bind_value %.loc8_32.1
// CHECK:STDOUT:   %.loc8_32.3: ref i32 = struct_access file.%y.var, element0
// CHECK:STDOUT:   %.loc8_32.4: init i32 = initialize_from %.loc8_32.2 to %.loc8_32.3
// CHECK:STDOUT:   %.loc8_32.5: ref (i32,) = struct_access %x.ref, element1
// CHECK:STDOUT:   %.loc8_32.6: ref i32 = tuple_access %.loc8_32.5, element0
// CHECK:STDOUT:   %.loc8_32.7: i32 = bind_value %.loc8_32.6
// CHECK:STDOUT:   %.loc8_32.8: ref (i32,) = struct_access file.%y.var, element1
// CHECK:STDOUT:   %.loc8_32.9: init (i32,) = tuple_init (%.loc8_32.7) to %.loc8_32.8
// CHECK:STDOUT:   %.loc8_32.10: init (i32,) = converted %.loc8_32.5, %.loc8_32.9
// CHECK:STDOUT:   %.loc8_32.11: init (i32,) = initialize_from %.loc8_32.10 to %.loc8_32.8
// CHECK:STDOUT:   %.loc8_32.12: init {.a: i32, .b: (i32,)} = struct_init (%.loc8_32.4, %.loc8_32.11) to file.%y.var
// CHECK:STDOUT:   %.loc8_33: init {.a: i32, .b: (i32,)} = converted %x.ref, %.loc8_32.12
// CHECK:STDOUT:   assign file.%y.var, %.loc8_33
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
