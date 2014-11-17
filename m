From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 5/5] mfd: s2mps11: Add binding documentation for Samsung
 S2MPS13 PMIC
Date: Mon, 17 Nov 2014 09:43:00 +0900
Message-ID: <1416184980-532-6-git-send-email-cw00.choi@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it
Cc: lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds the binding documentation for Samsung S2MPS13 PMIC
which is similiar with existing S2MPS14 PMIC. S2MPS13 has the different number
of regulators from S2MPS14 and RTC/Clock is the same with the S2MPS14.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 0e4026a..57a0450 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,5 +1,5 @@
 
-* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
+* Samsung S2MPS11, S2MPS13, S2MPS14 and S2MPU02 Voltage and Current Regulator
 
 The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
@@ -7,8 +7,8 @@ interfaced to the host controller using an I2C interface. Each sub-block is
 addressed by the host system using different I2C slave addresses.
 
 Required properties:
-- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic"
-              or "samsung,s2mpu02-pmic".
+- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps13-pmic"
+	      or "samsung,s2mps14-pmic" or "samsung,s2mpu02-pmic".
 - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
@@ -17,8 +17,8 @@ Optional properties:
 - interrupts: Interrupt specifiers for interrupt sources.
 
 Optional nodes:
-- clocks: s2mps11 and s5m8767 provide three(AP/CP/BT) buffered 32.768 KHz
-  outputs, so to register these as clocks with common clock framework
+- clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
+  KHz outputs, so to register these as clocks with common clock framework
   instantiate a sub-node named "clocks". It uses the common clock binding
   documented in :
   [Documentation/devicetree/bindings/clock/clock-bindings.txt]
@@ -30,12 +30,12 @@ Optional nodes:
     the clock which they consume.
     Clock               ID           Devices
     ----------------------------------------------------------
-    32KhzAP		0            S2MPS11, S2MPS14, S5M8767
-    32KhzCP		1            S2MPS11, S5M8767
-    32KhzBT		2            S2MPS11, S2MPS14, S5M8767
+    32KhzAP		0            S2MPS11, S2MPS13, S2MPS14, S5M8767
+    32KhzCP		1            S2MPS11, S2MPS13, S5M8767
+    32KhzBT		2            S2MPS11, S2MPS13, S2MPS14, S5M8767
 
-  - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps14-clk",
-		"samsung,s5m8767-clk"
+  - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
+		"samsung,s2mps14-clk", "samsung,s5m8767-clk"
 
 - regulators: The regulators of s2mps11 that have to be instantiated should be
 included in a sub-node named 'regulators'. Regulator nodes included in this
@@ -81,12 +81,14 @@ as per the datasheet of s2mps11.
 	- LDOn
 		  - valid values for n are:
 			- S2MPS11: 1 to 38
+			- S2MPS13: 1 to 40
 			- S2MPS14: 1 to 25
 			- S2MPU02: 1 to 28
 		  - Example: LDO1, LDO2, LDO28
 	- BUCKn
 		  - valid values for n are:
 			- S2MPS11: 1 to 10
+			- S2MPS13: 1 to 10
 			- S2MPS14: 1 to 5
 			- S2MPU02: 1 to 7
 		  - Example: BUCK1, BUCK2, BUCK9
-- 
1.8.5.5
