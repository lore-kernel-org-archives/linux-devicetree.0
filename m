From: Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH 2/2] dt-bindings: regulator: act8865 regulator modes and suspend states
Date: Sat, 10 Aug 2019 13:18:55 +0530
Message-ID: <1565423335-3213-3-git-send-email-raagjadav@gmail.com>
References: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565423335-3213-1-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Raag Jadav <raagjadav@gmail.com>
List-Id: devicetree@vger.kernel.org

Add documentation for act8865 regulator modes and suspend states.
Add active-semi,8865-regulator.h file for device tree binding constants
for act8865 regulators.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
 .../bindings/regulator/act8865-regulator.txt       | 27 +++++++++++++++++++--
 .../regulator/active-semi,8865-regulator.h         | 28 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/regulator/active-semi,8865-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index 3ae9f10..b9f58e4 100644
--- a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -34,6 +34,9 @@ Optional input supply properties:
   - inl67-supply: The input supply for LDO_REG3 and LDO_REG4
 
 Any standard regulator properties can be used to configure the single regulator.
+regulator-initial-mode, regulator-allowed-modes and regulator-mode could be specified
+for act8865 using mode values from dt-bindings/regulator/active-semi,8865-regulator.h
+file.
 
 The valid names for regulators are:
 	- for act8846:
@@ -47,6 +50,8 @@ The valid names for regulators are:
 Example:
 --------
 
+#include <dt-bindings/regulator/active-semi,8865-regulator.h>
+
 		i2c1: i2c@f0018000 {
 			pmic: act8865@5b {
 				compatible = "active-semi,act8865";
@@ -65,9 +70,19 @@ Example:
 						regulator-name = "VCC_1V2";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1300000>;
-						regulator-suspend-mem-microvolt = <1150000>;
-						regulator-suspend-standby-microvolt = <1150000>;
 						regulator-always-on;
+
+						regulator-allowed-modes = <ACT8865_REGULATOR_MODE_FIXED>,
+									  <ACT8865_REGULATOR_MODE_LOWPOWER>;
+						regulator-initial-mode = <ACT8865_REGULATOR_MODE_FIXED>;
+
+						regulator-state-mem {
+							regulator-on-in-suspend;
+							regulator-suspend-min-microvolt = <1150000>;
+							regulator-suspend-max-microvolt = <1150000>;
+							regulator-changeable-in-suspend;
+							regulator-mode = <ACT8865_REGULATOR_MODE_LOWPOWER>;
+						};
 					};
 
 					vcc_3v3_reg: DCDC_REG3 {
@@ -82,6 +97,14 @@ Example:
 						regulator-min-microvolt = <3300000>;
 						regulator-max-microvolt = <3300000>;
 						regulator-always-on;
+
+						regulator-allowed-modes = <ACT8865_REGULATOR_MODE_NORMAL>,
+									  <ACT8865_REGULATOR_MODE_LOWPOWER>;
+						regulator-initial-mode = <ACT8865_REGULATOR_MODE_NORMAL>;
+
+						regulator-state-mem {
+							regulator-off-in-suspend;
+						};
 					};
 
 					vddfuse_reg: LDO_REG2 {
diff --git a/include/dt-bindings/regulator/active-semi,8865-regulator.h b/include/dt-bindings/regulator/active-semi,8865-regulator.h
new file mode 100644
index 0000000..15473db
--- /dev/null
+++ b/include/dt-bindings/regulator/active-semi,8865-regulator.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Device Tree binding constants for the ACT8865 PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_ACT8865_H
+#define _DT_BINDINGS_REGULATOR_ACT8865_H
+
+/*
+ * These constants should be used to specify regulator modes in device tree for
+ * ACT8865 regulators as follows:
+ * ACT8865_REGULATOR_MODE_FIXED:	It is specific to DCDC regulators and it
+ *					specifies the usage of fixed-frequency
+ *					PWM.
+ *
+ * ACT8865_REGULATOR_MODE_NORMAL:	It is specific to LDO regulators and it
+ *					specifies the usage of normal mode.
+ *
+ * ACT8865_REGULATOR_MODE_LOWPOWER:	For DCDC and LDO regulators; it specify
+ *					the usage of proprietary power-saving
+ *					mode.
+ */
+
+#define ACT8865_REGULATOR_MODE_FIXED		1
+#define ACT8865_REGULATOR_MODE_NORMAL		2
+#define ACT8865_REGULATOR_MODE_LOWPOWER	3
+
+#endif
-- 
2.7.4
