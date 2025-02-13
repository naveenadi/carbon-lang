// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+7]]:42: ERROR: Duplicated field name `abc` in struct type literal.
// CHECK:STDERR: fn F() -> {.d: i32, .abc: i32, .e: i32, .abc: i32, .f: i32};
// CHECK:STDERR:                                          ^~~
// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+4]]:22: Field with the same name here.
// CHECK:STDERR: fn F() -> {.d: i32, .abc: i32, .e: i32, .abc: i32, .f: i32};
// CHECK:STDERR:                      ^~~
// CHECK:STDERR:
fn F() -> {.d: i32, .abc: i32, .e: i32, .abc: i32, .f: i32};

// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+7]]:19: ERROR: Duplicated field name `a` in struct type literal.
// CHECK:STDERR: let v: {.a: i32, .a: i32} = {.a = 1};
// CHECK:STDERR:                   ^
// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+4]]:10: Field with the same name here.
// CHECK:STDERR: let v: {.a: i32, .a: i32} = {.a = 1};
// CHECK:STDERR:          ^
// CHECK:STDERR:
let v: {.a: i32, .a: i32} = {.a = 1};

// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+7]]:26: ERROR: Duplicated field name `def` in struct literal.
// CHECK:STDERR: let w: i32 = {.def = 1, .def = 2}.def;
// CHECK:STDERR:                          ^~~
// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+4]]:16: Field with the same name here.
// CHECK:STDERR: let w: i32 = {.def = 1, .def = 2}.def;
// CHECK:STDERR:                ^~~
// CHECK:STDERR:
let w: i32 = {.def = 1, .def = 2}.def;

// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+7]]:30: ERROR: Duplicated field name `a` in struct literal.
// CHECK:STDERR: var x: {.a: i32} = {.a = 1, .a = 2};
// CHECK:STDERR:                              ^
// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+4]]:22: Field with the same name here.
// CHECK:STDERR: var x: {.a: i32} = {.a = 1, .a = 2};
// CHECK:STDERR:                      ^
// CHECK:STDERR:
var x: {.a: i32} = {.a = 1, .a = 2};

// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+6]]:39: ERROR: Duplicated field name `b` in struct literal.
// CHECK:STDERR: var y: {.b: i32, .c: i32} = {.b = 3, .b = 4};
// CHECK:STDERR:                                       ^
// CHECK:STDERR: fail_duplicate_name.carbon:[[@LINE+3]]:31: Field with the same name here.
// CHECK:STDERR: var y: {.b: i32, .c: i32} = {.b = 3, .b = 4};
// CHECK:STDERR:                               ^
var y: {.b: i32, .c: i32} = {.b = 3, .b = 4};

// CHECK:STDOUT: --- fail_duplicate_name.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Int32: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: Int32 = struct_value () [template]
// CHECK:STDOUT:   %F: type = fn_type @F [template]
// CHECK:STDOUT:   %struct.2: F = struct_value () [template]
// CHECK:STDOUT:   %.2: i32 = int_literal 1 [template]
// CHECK:STDOUT:   %.3: type = struct_type {.a: i32} [template]
// CHECK:STDOUT:   %.4: i32 = int_literal 2 [template]
// CHECK:STDOUT:   %.5: type = struct_type {.b: i32, .c: i32} [template]
// CHECK:STDOUT:   %.6: type = ptr_type {.b: i32, .c: i32} [template]
// CHECK:STDOUT:   %.7: i32 = int_literal 3 [template]
// CHECK:STDOUT:   %.8: i32 = int_literal 4 [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = %Core
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:     .x = %x
// CHECK:STDOUT:     .y = %y
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core: <namespace> = namespace [template] {}
// CHECK:STDOUT:   %import_ref.1: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.2: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.3: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.4: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.5: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %F.decl: F = fn_decl @F [template = constants.%struct.2] {
// CHECK:STDOUT:     %int.make_type_32.loc14_16: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc14_16.1: type = value_of_initializer %int.make_type_32.loc14_16 [template = i32]
// CHECK:STDOUT:     %.loc14_16.2: type = converted %int.make_type_32.loc14_16, %.loc14_16.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc14_27: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc14_27.1: type = value_of_initializer %int.make_type_32.loc14_27 [template = i32]
// CHECK:STDOUT:     %.loc14_27.2: type = converted %int.make_type_32.loc14_27, %.loc14_27.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc14_36: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc14_36.1: type = value_of_initializer %int.make_type_32.loc14_36 [template = i32]
// CHECK:STDOUT:     %.loc14_36.2: type = converted %int.make_type_32.loc14_36, %.loc14_36.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc14_47: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc14_47.1: type = value_of_initializer %int.make_type_32.loc14_47 [template = i32]
// CHECK:STDOUT:     %.loc14_47.2: type = converted %int.make_type_32.loc14_47, %.loc14_47.1 [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc14_56: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc14_56.1: type = value_of_initializer %int.make_type_32.loc14_56 [template = i32]
// CHECK:STDOUT:     %.loc14_56.2: type = converted %int.make_type_32.loc14_56, %.loc14_56.1 [template = i32]
// CHECK:STDOUT:     @F.%return: ref <error> = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref.6: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc23_13: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc23_13.1: type = value_of_initializer %int.make_type_32.loc23_13 [template = i32]
// CHECK:STDOUT:   %.loc23_13.2: type = converted %int.make_type_32.loc23_13, %.loc23_13.1 [template = i32]
// CHECK:STDOUT:   %import_ref.7: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc23_22: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc23_22.1: type = value_of_initializer %int.make_type_32.loc23_22 [template = i32]
// CHECK:STDOUT:   %.loc23_22.2: type = converted %int.make_type_32.loc23_22, %.loc23_22.1 [template = i32]
// CHECK:STDOUT:   %.loc23_35: i32 = int_literal 1 [template = constants.%.2]
// CHECK:STDOUT:   %.loc23_36: {.a: i32} = struct_literal (%.loc23_35)
// CHECK:STDOUT:   %v: <error> = bind_name v, <error>
// CHECK:STDOUT:   %import_ref.8: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc32: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc32_8.1: type = value_of_initializer %int.make_type_32.loc32 [template = i32]
// CHECK:STDOUT:   %.loc32_8.2: type = converted %int.make_type_32.loc32, %.loc32_8.1 [template = i32]
// CHECK:STDOUT:   %.loc32_22: i32 = int_literal 1 [template = constants.%.2]
// CHECK:STDOUT:   %.loc32_32: i32 = int_literal 2 [template = constants.%.4]
// CHECK:STDOUT:   %w: i32 = bind_name w, <error>
// CHECK:STDOUT:   %import_ref.9: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc41: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc41_13.1: type = value_of_initializer %int.make_type_32.loc41 [template = i32]
// CHECK:STDOUT:   %.loc41_13.2: type = converted %int.make_type_32.loc41, %.loc41_13.1 [template = i32]
// CHECK:STDOUT:   %.loc41_16: type = struct_type {.a: i32} [template = constants.%.3]
// CHECK:STDOUT:   %x.var: ref {.a: i32} = var x
// CHECK:STDOUT:   %x: ref {.a: i32} = bind_name x, %x.var
// CHECK:STDOUT:   %import_ref.10: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc49_13: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc49_13.1: type = value_of_initializer %int.make_type_32.loc49_13 [template = i32]
// CHECK:STDOUT:   %.loc49_13.2: type = converted %int.make_type_32.loc49_13, %.loc49_13.1 [template = i32]
// CHECK:STDOUT:   %import_ref.11: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %int.make_type_32.loc49_22: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc49_22.1: type = value_of_initializer %int.make_type_32.loc49_22 [template = i32]
// CHECK:STDOUT:   %.loc49_22.2: type = converted %int.make_type_32.loc49_22, %.loc49_22.1 [template = i32]
// CHECK:STDOUT:   %.loc49_25: type = struct_type {.b: i32, .c: i32} [template = constants.%.5]
// CHECK:STDOUT:   %y.var: ref {.b: i32, .c: i32} = var y
// CHECK:STDOUT:   %y: ref {.b: i32, .c: i32} = bind_name y, %y.var
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F() -> <error>;
// CHECK:STDOUT:
// CHECK:STDOUT: fn @__global_init() {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc41_26: i32 = int_literal 1 [template = constants.%.2]
// CHECK:STDOUT:   %.loc41_34: i32 = int_literal 2 [template = constants.%.4]
// CHECK:STDOUT:   assign file.%x.var, <error>
// CHECK:STDOUT:   %.loc49_35: i32 = int_literal 3 [template = constants.%.7]
// CHECK:STDOUT:   %.loc49_43: i32 = int_literal 4 [template = constants.%.8]
// CHECK:STDOUT:   assign file.%y.var, <error>
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
