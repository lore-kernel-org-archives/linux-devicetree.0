From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH] Documentation: update the of_selftest.txt
Date: Tue, 3 Mar 2015 03:56:48 +0000
Message-ID: <1425355008-56957-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, gaurav.minocha.os@gmail.com
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, long.wanglong@huawei.com, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

Since the directory "drivers/of/testcase-data" is renamed
to "drivers/of/unittest-data". so we should update the path
in the of_selftest.txt.

When the kernel is build with OF_SELFTEST enabled, the output
dtb is testcases.dtb instead of testcase.dtb, also update it
(s/testcase/testcases/).

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 Documentation/devicetree/of_selftest.txt | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/of_selftest.txt b/Documentation/devicetree/of_selftest.txt
index 57a808b..ffce144 100644
--- a/Documentation/devicetree/of_selftest.txt
+++ b/Documentation/devicetree/of_selftest.txt
@@ -22,31 +22,31 @@ most of the device drivers in various use cases.
 
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
 
 
-- 
1.8.3.4
