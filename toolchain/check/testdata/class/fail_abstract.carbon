// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

abstract class Abstract {
  var a: i32;
}

class Derived {
  extend base: Abstract;

  var d: i32;
}

fn Make() -> Derived {
  // TODO: This should be valid, and should construct an instance of `partial Abstract` as the base.
  // CHECK:STDERR: fail_abstract.carbon:[[@LINE+3]]:19: ERROR: Cannot construct instance of abstract class. Consider using `partial Abstract` instead.
  // CHECK:STDERR:   return {.base = {.a = 1}, .d = 7};
  // CHECK:STDERR:                   ^~~~~~~~
  return {.base = {.a = 1}, .d = 7};
}

fn Access(d: Derived) -> (i32, i32) {
  return (d.d, d.base.a);
}

// CHECK:STDOUT: --- fail_abstract.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %Abstract: type = class_type @Abstract [template]
// CHECK:STDOUT:   %Int32: type = fn_type @Int32 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: Int32 = struct_value () [template]
// CHECK:STDOUT:   %.2: type = unbound_element_type Abstract, i32 [template]
// CHECK:STDOUT:   %.3: type = struct_type {.a: i32} [template]
// CHECK:STDOUT:   %Derived: type = class_type @Derived [template]
// CHECK:STDOUT:   %.4: type = ptr_type {.a: i32} [template]
// CHECK:STDOUT:   %.5: type = unbound_element_type Derived, Abstract [template]
// CHECK:STDOUT:   %.6: type = unbound_element_type Derived, i32 [template]
// CHECK:STDOUT:   %.7: type = struct_type {.base: Abstract, .d: i32} [template]
// CHECK:STDOUT:   %Make: type = fn_type @Make [template]
// CHECK:STDOUT:   %struct.2: Make = struct_value () [template]
// CHECK:STDOUT:   %.8: type = struct_type {.base: {.a: i32}*, .d: i32} [template]
// CHECK:STDOUT:   %.9: type = ptr_type {.base: {.a: i32}*, .d: i32} [template]
// CHECK:STDOUT:   %.10: type = ptr_type {.base: Abstract, .d: i32} [template]
// CHECK:STDOUT:   %.11: i32 = int_literal 1 [template]
// CHECK:STDOUT:   %.12: i32 = int_literal 7 [template]
// CHECK:STDOUT:   %.13: type = struct_type {.base: {.a: i32}, .d: i32} [template]
// CHECK:STDOUT:   %.14: type = tuple_type (type, type) [template]
// CHECK:STDOUT:   %.15: type = tuple_type (i32, i32) [template]
// CHECK:STDOUT:   %Access: type = fn_type @Access [template]
// CHECK:STDOUT:   %struct.3: Access = struct_value () [template]
// CHECK:STDOUT:   %.16: type = ptr_type (i32, i32) [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Core = %Core
// CHECK:STDOUT:     .Abstract = %Abstract.decl
// CHECK:STDOUT:     .Derived = %Derived.decl
// CHECK:STDOUT:     .Make = %Make.decl
// CHECK:STDOUT:     .Access = %Access.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Core: <namespace> = namespace [template] {}
// CHECK:STDOUT:   %Abstract.decl: type = class_decl @Abstract [template = constants.%Abstract] {}
// CHECK:STDOUT:   %import_ref.1: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %Derived.decl: type = class_decl @Derived [template = constants.%Derived] {}
// CHECK:STDOUT:   %import_ref.2: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %Make.decl: Make = fn_decl @Make [template = constants.%struct.2] {
// CHECK:STDOUT:     %Derived.ref.loc17: type = name_ref Derived, %Derived.decl [template = constants.%Derived]
// CHECK:STDOUT:     @Make.%return: ref Derived = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref.3: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.4: Int32 = import_ref ir3, inst+3, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %Access.decl: Access = fn_decl @Access [template = constants.%struct.3] {
// CHECK:STDOUT:     %Derived.ref.loc25: type = name_ref Derived, %Derived.decl [template = constants.%Derived]
// CHECK:STDOUT:     %d.loc25_11.1: Derived = param d
// CHECK:STDOUT:     @Access.%d: Derived = bind_name d, %d.loc25_11.1
// CHECK:STDOUT:     %int.make_type_32.loc25_27: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %int.make_type_32.loc25_32: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:     %.loc25_35.1: (type, type) = tuple_literal (%int.make_type_32.loc25_27, %int.make_type_32.loc25_32)
// CHECK:STDOUT:     %.loc25_35.2: type = value_of_initializer %int.make_type_32.loc25_27 [template = i32]
// CHECK:STDOUT:     %.loc25_35.3: type = converted %int.make_type_32.loc25_27, %.loc25_35.2 [template = i32]
// CHECK:STDOUT:     %.loc25_35.4: type = value_of_initializer %int.make_type_32.loc25_32 [template = i32]
// CHECK:STDOUT:     %.loc25_35.5: type = converted %int.make_type_32.loc25_32, %.loc25_35.4 [template = i32]
// CHECK:STDOUT:     %.loc25_35.6: type = converted %.loc25_35.1, constants.%.15 [template = constants.%.15]
// CHECK:STDOUT:     @Access.%return: ref (i32, i32) = var <return slot>
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Abstract {
// CHECK:STDOUT:   %int.make_type_32: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc8_10.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:   %.loc8_10.2: type = converted %int.make_type_32, %.loc8_10.1 [template = i32]
// CHECK:STDOUT:   %.loc8_8: <unbound element of class Abstract> = field_decl a, element0 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Abstract
// CHECK:STDOUT:   .a = %.loc8_8
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @Derived {
// CHECK:STDOUT:   %Abstract.ref: type = name_ref Abstract, file.%Abstract.decl [template = constants.%Abstract]
// CHECK:STDOUT:   %.loc12: <unbound element of class Derived> = base_decl Abstract, element0 [template]
// CHECK:STDOUT:   %int.make_type_32: init type = call constants.%struct.1() [template = i32]
// CHECK:STDOUT:   %.loc14_10.1: type = value_of_initializer %int.make_type_32 [template = i32]
// CHECK:STDOUT:   %.loc14_10.2: type = converted %int.make_type_32, %.loc14_10.1 [template = i32]
// CHECK:STDOUT:   %.loc14_8: <unbound element of class Derived> = field_decl d, element1 [template]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = constants.%Derived
// CHECK:STDOUT:   .base = %.loc12
// CHECK:STDOUT:   .d = %.loc14_8
// CHECK:STDOUT:   extend name_scope2
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Int32() -> type = "int.make_type_32";
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Make() -> %return: Derived {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc22_25: i32 = int_literal 1 [template = constants.%.11]
// CHECK:STDOUT:   %.loc22_26: {.a: i32} = struct_literal (%.loc22_25)
// CHECK:STDOUT:   %.loc22_34: i32 = int_literal 7 [template = constants.%.12]
// CHECK:STDOUT:   %.loc22_35: {.base: {.a: i32}, .d: i32} = struct_literal (%.loc22_26, %.loc22_34)
// CHECK:STDOUT:   return <error> to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Access(%d: Derived) -> %return: (i32, i32) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %d.ref.loc26_11: Derived = name_ref d, %d
// CHECK:STDOUT:   %d.ref.loc26_12: <unbound element of class Derived> = name_ref d, @Derived.%.loc14_8 [template = @Derived.%.loc14_8]
// CHECK:STDOUT:   %.loc26_12.1: ref i32 = class_element_access %d.ref.loc26_11, element1
// CHECK:STDOUT:   %.loc26_12.2: i32 = bind_value %.loc26_12.1
// CHECK:STDOUT:   %d.ref.loc26_16: Derived = name_ref d, %d
// CHECK:STDOUT:   %base.ref: <unbound element of class Derived> = name_ref base, @Derived.%.loc12 [template = @Derived.%.loc12]
// CHECK:STDOUT:   %.loc26_17.1: ref Abstract = class_element_access %d.ref.loc26_16, element0
// CHECK:STDOUT:   %.loc26_17.2: Abstract = bind_value %.loc26_17.1
// CHECK:STDOUT:   %a.ref: <unbound element of class Abstract> = name_ref a, @Abstract.%.loc8_8 [template = @Abstract.%.loc8_8]
// CHECK:STDOUT:   %.loc26_22.1: ref i32 = class_element_access %.loc26_17.2, element0
// CHECK:STDOUT:   %.loc26_22.2: i32 = bind_value %.loc26_22.1
// CHECK:STDOUT:   %.loc26_24.1: (i32, i32) = tuple_literal (%.loc26_12.2, %.loc26_22.2)
// CHECK:STDOUT:   %.loc26_24.2: ref i32 = tuple_access %return, element0
// CHECK:STDOUT:   %.loc26_24.3: init i32 = initialize_from %.loc26_12.2 to %.loc26_24.2
// CHECK:STDOUT:   %.loc26_24.4: ref i32 = tuple_access %return, element1
// CHECK:STDOUT:   %.loc26_24.5: init i32 = initialize_from %.loc26_22.2 to %.loc26_24.4
// CHECK:STDOUT:   %.loc26_24.6: init (i32, i32) = tuple_init (%.loc26_24.3, %.loc26_24.5) to %return
// CHECK:STDOUT:   %.loc26_25: init (i32, i32) = converted %.loc26_24.1, %.loc26_24.6
// CHECK:STDOUT:   return %.loc26_25 to %return
// CHECK:STDOUT: }
// CHECK:STDOUT:
