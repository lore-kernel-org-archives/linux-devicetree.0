From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: act8865 regulator modes and suspend states" to the regulator tree
Date: Thu, 15 Aug 2019 18:14:34 +0100 (BST)
Message-ID: <20190815171434.A604C2742B9E@ypsilon.sirena.org.uk>
References: <1565721176-8955-3-git-send-email-raagjadav@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565721176-8955-3-git-send-email-raagjadav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Raag Jadav <raagjadav@gmail.com>
Cc: devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: act8865 regulator modes and suspend states

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From ff461ebfd4b7051d9b79ca023741e6c2d960a912 Mon Sep 17 00:00:00 2001
From: Raag Jadav <raagjadav@gmail.com>
Date: Wed, 14 Aug 2019 00:02:56 +0530
Subject: [PATCH] regulator: act8865 regulator modes and suspend states

Add documentation for act8865 regulator modes and suspend states.
Add active-semi,8865-regulator.h file for device tree binding constants
for act8865 regulators.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
Link: https://lore.kernel.org/r/1565721176-8955-3-git-send-email-raagjadav@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/act8865-regulator.txt  | 27 ++++++++++++++++--
 .../regulator/active-semi,8865-regulator.h    | 28 +++++++++++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/regulator/active-semi,8865-regulator.h

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index 3ae9f1088845..b9f58e480349 100644
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
index 000000000000..15473dbeaf38
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
2.20.1
