// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

namespace N;

// CHECK:STDERR: fail_base_as_declared_name.carbon:[[@LINE+7]]:6: ERROR: `.` should be followed by a name.
// CHECK:STDERR: fn N.base() {}
// CHECK:STDERR:      ^~~~
// CHECK:STDERR:
// CHECK:STDERR: fail_base_as_declared_name.carbon:[[@LINE+3]]:6: ERROR: Semantics TODO: `HandleInvalidParse`.
// CHECK:STDERR: fn N.base() {}
// CHECK:STDERR:      ^~~~
fn N.base() {}

// CHECK:STDOUT: --- fail_base_as_declared_name.carbon
// CHECK:STDOUT:
// CHECK:STDOUT: file {}
// CHECK:STDOUT:
