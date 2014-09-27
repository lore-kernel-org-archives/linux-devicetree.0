From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 1/2] DT: add binding for mxs regulator
Date: Sat, 27 Sep 2014 00:59:47 +0000
Message-ID: <1411779588-22031-2-git-send-email-stefan.wahren@i2se.com>
References: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411779588-22031-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, shawn.guo@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: festevam@gmail.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch adds the Device tree bindings for the Freescale MXS
on-chip regulators.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../bindings/regulator/mxs-regulator.txt           |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mxs-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mxs-regulator.txt b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
new file mode 100644
index 0000000..e3133a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mxs-regulator.txt
@@ -0,0 +1,36 @@
+MXS regulators
+
+Required node properties:
+- compatible: Should be "simple-bus"
+- #address-cells: Number of cells required to define regulator register,
+  must be 1
+- #size-cells: Number of cells required to define register size, must be 1
+- reg: Absolute physical address and size of the register set for the device
+
+Required regulator properties:
+- compatible: Must be "fsl,mxs-regulator"
+- reg: Absolute physical address of the register set for the regulator
+
+Any regulator property defined as part of the core regulator
+binding, defined in regulator.txt, can also be used.
+
+Example:
+
+	power: power@80044000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x80044000 0x2000>;
+		ranges;
+
+		reg_vddd: regulator@80044040 {
+			reg = <0x80044040 0x10>;
+			compatible = "fsl,mxs-regulator";
+			regulator-name = "vddd";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1575000>;
+			regulator-boot-on;
+			vddd-supply = <&reg_vdda>;
+		};
+	};
+
-- 
1.7.9.5
