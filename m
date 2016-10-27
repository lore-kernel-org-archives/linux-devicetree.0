From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Subject: [PATCH V2 1/4] Documentation: pv88080: Move binding document
Date: Thu, 27 Oct 2016 10:03:14 +0900
Message-ID: <4e0bd042e35f13c06511ca9b3f790b5ceaf34451.1477530195.git.eric.jeong@diasemi.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1477530195.git.eric.jeong@diasemi.com>
Sender: linux-gpio-owner@vger.kernel.org
To: DEVICETREE <devicetree@vger.kernel.org>, LINUX-KERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, LINUX-GPIO <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource@diasemi.com>

The change is to move pv88080 binding document 
from the regulator directory to mfd binding directory
for PV88080 PMIC MFD support.


Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>

---
This patch applies against linux-next and next-20161026

Hi,

Change since PATCH V1
 - Patch separated from PATCH V1

Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 Documentation/devicetree/bindings/mfd/pv88080.txt  |   63 ++++++++++++++++++++
 .../devicetree/bindings/regulator/pv88080.txt      |   62 -------------------
 2 files changed, 63 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/pv88080.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/pv88080.txt

diff --git a/Documentation/devicetree/bindings/mfd/pv88080.txt b/Documentation/devicetree/bindings/mfd/pv88080.txt
new file mode 100644
index 0000000..7b556b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/pv88080.txt
@@ -0,0 +1,63 @@
+* Powerventure Semiconductor PV88080 PMIC
+
+Required properties:
+- compatible: Must be one of the following, depending on the
+  silicon version:
+	- "pvs,pv88080" (DEPRECATED)
+
+	- "pvs,pv88080-aa" for PV88080 AA or AB silicon
+	- "pvs,pv88080-ba" for PV88080 BA or BB silicon
+  NOTE: The use of the compatibles with no silicon version is deprecated.
+- reg: I2C slave address, usually 0x49
+- interrupts: the interrupt outputs of the controller
+- regulators: A node that houses a sub-node for each regulator within the
+  device. Each sub-node is identified using the node's name, with valid
+  values listed below. The content of each sub-node is defined by the
+  standard binding for regulators; see regulator.txt.
+  BUCK1, BUCK2, BUCK3 and HVBUCK.
+
+Optional properties:
+- Any optional property defined in regulator.txt
+  and gpio.txt for more information.
+
+Example:
+
+	pmic: pv88080@49 {
+		compatible = "pvs,pv88080-ba";
+		reg = <0x49>;
+		interrupt-parent = <&gpio>;
+		interrupts = <24 24>;
+
+		regulators {
+			BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = < 600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-min-microamp 	= < 220000>;
+				regulator-max-microamp 	= <7040000>;
+			};
+
+			BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = < 600000>;
+				regulator-max-microvolt = <1393750>;
+				regulator-min-microamp 	= <1496000>;
+				regulator-max-microamp 	= <4189000>;
+			};
+
+			BUCK3 {
+				regulator-name = "buck3";
+				regulator-min-microvolt = <1400000>;
+				regulator-max-microvolt = <2193750>;
+				regulator-min-microamp 	= <1496000>;
+				regulator-max-microamp 	= <4189000>;
+			};
+
+			HVBUCK {
+				regulator-name = "hvbuck";
+				regulator-min-microvolt = <   5000>;
+				regulator-max-microvolt = <1275000>;
+ 			};
+		};
+	};
+
diff --git a/Documentation/devicetree/bindings/regulator/pv88080.txt b/Documentation/devicetree/bindings/regulator/pv88080.txt
deleted file mode 100644
index e6e4b9c8..0000000
--- a/Documentation/devicetree/bindings/regulator/pv88080.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Powerventure Semiconductor PV88080 Voltage Regulator
-
-Required properties:
-- compatible: Must be one of the following, depending on the
-  silicon version:
-	- "pvs,pv88080" (DEPRECATED)
-
-	- "pvs,pv88080-aa" for PV88080 AA or AB silicon
-	- "pvs,pv88080-ba" for PV88080 BA or BB silicon
-  NOTE: The use of the compatibles with no silicon version is deprecated.
-- reg: I2C slave address, usually 0x49
-- interrupts: the interrupt outputs of the controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name, with valid
-  values listed below. The content of each sub-node is defined by the
-  standard binding for regulators; see regulator.txt.
-  BUCK1, BUCK2, BUCK3 and HVBUCK.
-
-Optional properties:
-- Any optional property defined in regulator.txt
-
-Example:
-
-	pmic: pv88080@49 {
-		compatible = "pvs,pv88080-ba";
-		reg = <0x49>;
-		interrupt-parent = <&gpio>;
-		interrupts = <24 24>;
-
-		regulators {
-			BUCK1 {
-				regulator-name = "buck1";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1393750>;
-				regulator-min-microamp 	= < 220000>;
-				regulator-max-microamp 	= <7040000>;
-			};
-
-			BUCK2 {
-				regulator-name = "buck2";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1393750>;
-				regulator-min-microamp 	= <1496000>;
-				regulator-max-microamp 	= <4189000>;
-			};
-
-			BUCK3 {
-				regulator-name = "buck3";
-				regulator-min-microvolt = <1400000>;
-				regulator-max-microvolt = <2193750>;
-				regulator-min-microamp 	= <1496000>;
-				regulator-max-microamp 	= <4189000>;
-			};
-
-			HVBUCK {
-				regulator-name = "hvbuck";
-				regulator-min-microvolt = <   5000>;
-				regulator-max-microvolt = <1275000>;
- 			};
-		};
-	};
-
-- 
end-of-patch for PATCH V2

