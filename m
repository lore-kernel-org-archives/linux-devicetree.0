From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH 3/5] Documentation: update the of_selftest.txt
Date: Wed, 11 Mar 2015 03:37:21 +0000
Message-ID: <1426045043-128610-4-git-send-email-long.wanglong@huawei.com>
References: <1426045043-128610-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426045043-128610-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav.minocha.os@gmail.com, robherring2@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, grant.likely@linaro.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com, long.wanglong@huawei.com, ijc+devicetree@hellion.org.uk
List-Id: devicetree@vger.kernel.org

Since the directory "drivers/of/testcase-data" is renamed
to "drivers/of/unittest-data". so we should update the path
in the of_selftest.txt.

When the kernel is built with OF_UNITTEST enabled, the output
dtb is testcases.dtb instead of testcase.dtb, also update it
(s/testcase/testcases/).

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 Documentation/devicetree/of_selftest.txt | 35 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/devicetree/of_selftest.txt
index 57a808b..d79a6bc 100644
--- a/Documentation/devicetree/of_selftest.txt
+++ b/Documentation/devicetree/of_selftest.txt
@@ -1,11 +1,11 @@
-Open Firmware Device Tree Selftest
+Open Firmware Device Tree Unittest
 ----------------------------------
 
 Author: Gaurav Minocha <gaurav.minocha.os@gmail.com>
 
 1. Introduction
 
-This document explains how the test data required for executing OF selftest
+This document explains how the test data required for executing OF unittest
 is attached to the live tree dynamically, independent of the machine's
 architecture.
 
@@ -22,31 +22,32 @@ most of the device drivers in various use cases.
 
 2. Test-data
 
-The Device Tree Source file (drivers/of/testcase-data/testcases.dts) contains
+The Device Tree Source file (drivers/of/unittest-data/testcases.dts) contains
 the test data required for executing the unit tests automated in
-drivers/of/selftests.c. Currently, following Device Tree Source Include files
-(.dtsi) are included in testcase.dts:
+drivers/of/unittest.c. Currently, following Device Tree Source Include files
+(.dtsi) are included in testcases.dts:
 
-drivers/of/testcase-data/tests-interrupts.dtsi
-drivers/of/testcase-data/tests-platform.dtsi
-drivers/of/testcase-data/tests-phandle.dtsi
-drivers/of/testcase-data/tests-match.dtsi
+drivers/of/unittest-data/tests-interrupts.dtsi
+drivers/of/unittest-data/tests-platform.dtsi
+drivers/of/unittest-data/tests-phandle.dtsi
+drivers/of/unittest-data/tests-match.dtsi
+drivers/of/unittest-data/tests-overlay.dtsi
 
 When the kernel is build with OF_SELFTEST enabled, then the following make rule
 
 $(obj)/%.dtb: $(src)/%.dts FORCE
 	$(call if_changed_dep, dtc)
 
-is used to compile the DT source file (testcase.dts) into a binary blob
-(testcase.dtb), also referred as flattened DT.
+is used to compile the DT source file (testcases.dts) into a binary blob
+(testcases.dtb), also referred as flattened DT.
 
 After that, using the following rule the binary blob above is wrapped as an
-assembly file (testcase.dtb.S).
+assembly file (testcases.dtb.S).
 
 $(obj)/%.dtb.S: $(obj)/%.dtb
 	$(call cmd, dt_S_dtb)
 
-The assembly file is compiled into an object file (testcase.dtb.o), and is
+The assembly file is compiled into an object file (testcases.dtb.o), and is
 linked into the kernel image.
 
 
@@ -98,8 +99,8 @@ child11 -> sibling12 -> sibling13 -> sibling14 -> null
 Figure 1: Generic structure of un-flattened device tree
 
 
-Before executing OF selftest, it is required to attach the test data to
-machine's device tree (if present). So, when selftest_data_add() is called,
+Before executing OF unittest, it is required to attach the test data to
+machine's device tree (if present). So, when unittest_data_add() is called,
 at first it reads the flattened device tree data linked into the kernel image
 via the following kernel symbols:
 
@@ -186,10 +187,10 @@ update_node_properties().
 
 2.2. Removing the test data
 
-Once the test case execution is complete, selftest_data_remove is called in
+Once the test case execution is complete, unittest_data_remove is called in
 order to remove the device nodes attached initially (first the leaf nodes are
 detached and then moving up the parent nodes are removed, and eventually the
-whole tree). selftest_data_remove() calls detach_node_and_children() that uses
+whole tree). unittest_data_remove() calls detach_node_and_children() that uses
 of_detach_node() to detach the nodes from the live device tree.
 
 To detach a node, of_detach_node() either updates the child pointer of given
-- 
1.8.3.4
