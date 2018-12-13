From: <Claudiu.Beznea@microchip.com>
Subject: [PATCH v4 2/6] regulator: add documentation for regulator modes and
 suspend states
Date: Thu, 13 Dec 2018 12:49:51 +0000
Message-ID: <1544703110-27161-3-git-send-email-claudiu.beznea@microchip.com>
References: <1544703110-27161-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544703110-27161-1-git-send-email-claudiu.beznea@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Claudiu.Beznea@microchip.com
List-Id: devicetree@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Add documentation for regulator modes and suspend states.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 .../bindings/regulator/act8945a-regulator.txt      | 34 ++++++++++++++++++=
++++
 .../regulator/active-semi,8945a-regulator.h        | 30 ++++++++++++++++++=
+
 2 files changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/regulator/active-semi,8945a-regulat=
or.h

diff --git a/Documentation/devicetree/bindings/regulator/act8945a-regulator=
.txt b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
index ac955dea00d1..4017527619ab 100644
--- a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
@@ -15,11 +15,17 @@ Optional input supply properties:
   - inl67-supply: The input supply for REG_LDO3 and REG_LDO4
=20
 Any standard regulator properties can be used to configure the single regu=
lator.
+regulator-initial-mode, regulator-allowed-modes and regulator-mode could b=
e
+specified using mode values from dt-bindings/regulator/active-semi,8945a-r=
egulator.h
+file.
=20
 The valid names for regulators are:
 	REG_DCDC1, REG_DCDC2, REG_DCDC3, REG_LDO1, REG_LDO2, REG_LDO3, REG_LDO4.
=20
 Example:
+
+#include <dt-bindings/regulator/active-semi,8945a-regulator.h>
+
 	pmic@5b {
 		compatible =3D "active-semi,act8945a";
 		reg =3D <0x5b>;
@@ -32,6 +38,18 @@ Example:
 				regulator-min-microvolt =3D <1350000>;
 				regulator-max-microvolt =3D <1350000>;
 				regulator-always-on;
+
+				regulator-allowed-modes =3D <ACT8945A_REGULATOR_MODE_FIXED>,
+							  <ACT8945A_REGULATOR_MODE_LOWPOWER>;
+				regulator-initial-mode =3D <ACT8945A_REGULATOR_MODE_FIXED>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-min-microvolt=3D<1400000>;
+					regulator-suspend-max-microvolt=3D<1400000>;
+					regulator-changeable-in-suspend;
+					regulator-mode=3D<ACT8945A_REGULATOR_MODE_LOWPOWER>;
+				};
 			};
=20
 			vdd_1v2_reg: REG_DCDC2 {
@@ -39,6 +57,14 @@ Example:
 				regulator-min-microvolt =3D <1100000>;
 				regulator-max-microvolt =3D <1300000>;
 				regulator-always-on;
+
+				regulator-allowed-modes =3D <ACT8945A_REGULATOR_MODE_FIXED>,
+							  <ACT8945A_REGULATOR_MODE_LOWPOWER>;
+				regulator-initial-mode =3D <ACT8945A_REGULATOR_MODE_FIXED>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
=20
 			vdd_3v3_reg: REG_DCDC3 {
@@ -53,6 +79,14 @@ Example:
 				regulator-min-microvolt =3D <2500000>;
 				regulator-max-microvolt =3D <2500000>;
 				regulator-always-on;
+
+				regulator-allowed-modes =3D <ACT8945A_REGULATOR_MODE_NORMAL>,
+							  <ACT8945A_REGULATOR_MODE_LOWPOWER>;
+				regulator-initial-mode =3D <ACT8945A_REGULATOR_MODE_NORMAL>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
 			};
=20
 			vdd_3v3_lp_reg: REG_LDO2 {
diff --git a/include/dt-bindings/regulator/active-semi,8945a-regulator.h b/=
include/dt-bindings/regulator/active-semi,8945a-regulator.h
new file mode 100644
index 000000000000..9bdba5e3141a
--- /dev/null
+++ b/include/dt-bindings/regulator/active-semi,8945a-regulator.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 Microchip Technology, Inc. All rights reserved.
+ *
+ * Device Tree binding constants for the ACT8945A PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_ACT8945A_H
+#define _DT_BINDINGS_REGULATOR_ACT8945A_H
+
+/*
+ * These constants should be used to specify regulator modes in device tre=
e for
+ * ACT8945A regulators as follows:
+ * ACT8945A_REGULATOR_MODE_FIXED:	It is specific to DCDC regulators and it
+ *					specifies the usage of fixed-frequency
+ *					PWM.
+ *
+ * ACT8945A_REGULATOR_MODE_NORMAL:	It is specific to LDO regulators and it
+ *					specifies the usage of normal mode.
+ *
+ * ACT8945A_REGULATOR_MODE_LOWPOWER:	For DCDC and LDO regulators; it speci=
fy
+ *					the usage of proprietary power-saving
+ *					mode.
+ */
+
+#define ACT8945A_REGULATOR_MODE_FIXED		1
+#define ACT8945A_REGULATOR_MODE_NORMAL		2
+#define ACT8945A_REGULATOR_MODE_LOWPOWER	3
+
+#endif
--=20
2.7.4
