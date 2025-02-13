// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// --- a.carbon

package Foo library "a";

class C1(T:! type);
class C2(T:! type);

// --- fail_b.carbon

package Foo library "b";

import library "a";

export C1;

// CHECK:STDERR: fail_b.carbon:[[@LINE+3]]:10: ERROR: `export` declaration cannot have parameters.
// CHECK:STDERR: export C2(T:! type);
// CHECK:STDERR:          ^~~~~~~~~~
export C2(T:! type);

// CHECK:STDOUT: --- a.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %T: type = bind_symbolic_name T 0 [symbolic]
// CHECK:STDOUT:   %C1.1: type = generic_class_type @C1 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: C1 = struct_value () [template]
// CHECK:STDOUT:   %C1.2: type = class_type @C1 [template]
// CHECK:STDOUT:   %C2.1: type = generic_class_type @C2 [template]
// CHECK:STDOUT:   %struct.2: C2 = struct_value () [template]
// CHECK:STDOUT:   %C2.2: type = class_type @C2 [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .C1 = %C1.decl
// CHECK:STDOUT:     .C2 = %C2.decl
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %C1.decl: C1 = class_decl @C1 [template = constants.%struct.1] {
// CHECK:STDOUT:     %T.loc4_10.1: type = param T
// CHECK:STDOUT:     %T.loc4_10.2: type = bind_symbolic_name T 0, %T.loc4_10.1 [symbolic = constants.%T]
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %C2.decl: C2 = class_decl @C2 [template = constants.%struct.2] {
// CHECK:STDOUT:     %T.loc5_10.1: type = param T
// CHECK:STDOUT:     %T.loc5_10.2: type = bind_symbolic_name T 0, %T.loc5_10.1 [symbolic = constants.%T]
// CHECK:STDOUT:   }
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C1;
// CHECK:STDOUT:
// CHECK:STDOUT: class @C2;
// CHECK:STDOUT:
// CHECK:STDOUT: --- fail_b.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: constants {
// CHECK:STDOUT:   %C1: type = generic_class_type @C1 [template]
// CHECK:STDOUT:   %.1: type = tuple_type () [template]
// CHECK:STDOUT:   %struct.1: C1 = struct_value () [template]
// CHECK:STDOUT:   %T: type = bind_symbolic_name T 0, <unexpected instref inst+17> [symbolic]
// CHECK:STDOUT:   %C2: type = generic_class_type @C2 [template]
// CHECK:STDOUT:   %struct.2: C2 = struct_value () [template]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: file {
// CHECK:STDOUT:   package: <namespace> = namespace [template] {
// CHECK:STDOUT:     .C1 = %C1
// CHECK:STDOUT:     .C2 = %C2
// CHECK:STDOUT:   }
// CHECK:STDOUT:   %import_ref.1: C1 = import_ref ir1, inst+4, loaded [template = constants.%struct.1]
// CHECK:STDOUT:   %import_ref.2: C2 = import_ref ir1, inst+11, loaded [template = constants.%struct.2]
// CHECK:STDOUT:   %C1: C1 = export C1, %import_ref.1 [template = constants.%struct.1]
// CHECK:STDOUT:   %T.loc11_11.1: type = param T
// CHECK:STDOUT:   %T.loc11_11.2: type = bind_symbolic_name T 0, %T.loc11_11.1 [symbolic = constants.%T]
// CHECK:STDOUT:   %C2: C2 = export C2, %import_ref.2 [template = constants.%struct.2]
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: class @C1;
// CHECK:STDOUT:
// CHECK:STDOUT: class @C2;
// CHECK:STDOUT:
