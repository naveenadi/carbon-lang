// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

interface Empty {}

fn F(T:! Empty) {
  var x: T;
}

// CHECK:STDOUT: --- as_type_of_type.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %.1: type = interface_type @Empty [template]
// CHECK:STDOUT:   %Self: Empty = bind_symbolic_name Self 0 [symbolic]
// CHECK:STDOUT:   %T: Empty = bind_symbolic_name T 0 [symbolic]
// CHECK:STDOUT:   %F: type = fn_type @F [template]
// CHECK:STDOUT:   %.2: type = tuple_type () [template]
// CHECK:STDOUT:   %struct: F = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .Empty = %Empty.decl
// CHECK:STDOUT:     .F = %F.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %Empty.decl: type = interface_decl @Empty [template = constants.%.1] {}
// CHECK:STDOUT:   %F.decl: F = fn_decl @F [template = constants.%struct] {
// CHECK:STDOUT:     %Empty.ref: type = name_ref Empty, %Empty.decl [template = constants.%.1]
// CHECK:STDOUT:     %T.loc9_6.1: Empty = param T
// CHECK:STDOUT:     @F.%T: Empty = bind_symbolic_name T 0, %T.loc9_6.1 [symbolic = constants.%T]
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: interface @Empty {
// CHECK:STDOUT:   %Self: Empty = bind_symbolic_name Self 0 [symbolic = constants.%Self]
// CHECK:STDOUT:
// CHECK:STDOUT: !members:
// CHECK:STDOUT:   .Self = %Self
// CHECK:STDOUT:   witness = ()
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @F(%T: Empty) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %T.ref: Empty = name_ref T, %T [symbolic = constants.%T]
// CHECK:STDOUT:   %.loc10_10.1: type = facet_type_access %T.ref [symbolic = constants.%T]
// CHECK:STDOUT:   %.loc10_10.2: type = converted %T.ref, %.loc10_10.1 [symbolic = constants.%T]
// CHECK:STDOUT:   %x.var: ref T = var x
// CHECK:STDOUT:   %x: ref T = bind_name x, %x.var
// CHECK:STDOUT:   return
// CHECK:STDOUT: }
// CHECK:STDOUT:
