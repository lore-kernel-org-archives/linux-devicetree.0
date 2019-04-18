From: Mark Brown <broonie@kernel.org>
Subject: Applied "dt-bindings: regulator: add document bindings for slg51000" to the regulator tree
Date: Thu, 18 Apr 2019 11:26:06 +0100 (BST)
Message-ID: <20190418102606.ED0C61126DCF@debutante.sirena.org.uk>
References: <bbf407bfb94fb10e61a8e6aabbbde62395db3034.1555567784.git.eric.jeong.opensource@diasemi.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bbf407bfb94fb10e61a8e6aabbbde62395db3034.1555567784.git.eric.jeong.opensource@diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Jeong <eric.jeong.opensource@diasemi.com>
Cc: DEVICETREE <devicetree@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, LINUX-KERNEL <linux-kernel@vger.kernel.org>linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

The patch

   dt-bindings: regulator: add document bindings for slg51000

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

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

>From 3e66a006c10fd23855b5bb0fc4ff9949b80f7724 Mon Sep 17 00:00:00 2001
From: Eric Jeong <eric.jeong.opensource@diasemi.com>
Date: Thu, 18 Apr 2019 15:09:44 +0900
Subject: [PATCH] dt-bindings: regulator: add document bindings for slg51000

Add device tree binding information for slg51000 regulator driver.
Example bindings for SLG51000 are added.

Signed-off-by: Eric Jeong <eric.jeong.opensource@diasemi.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/regulator/slg51000.txt           | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/slg51000.txt

diff --git a/Documentation/devicetree/bindings/regulator/slg51000.txt b/Documentation/devicetree/bindings/regulator/slg51000.txt
new file mode 100644
index 000000000000..aa0733e49b90
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/slg51000.txt
@@ -0,0 +1,88 @@
+* Dialog Semiconductor SLG51000 Voltage Regulator
+
+Required properties:
+- compatible : Should be "dlg,slg51000" for SLG51000
+- reg : Specifies the I2C slave address.
+- xxx-supply: Input voltage supply regulator for ldo3 to ldo7.
+  These entries are required if regulators are enabled for a device.
+  An absence of these properties can cause the regulator registration to fail.
+  If some of input supply is powered through battery or always-on supply then
+  also it is required to have these parameters with proper node handle of always
+  on power supply.
+    vin3-supply: Input supply for ldo3
+    vin4-supply: Input supply for ldo4
+    vin5-supply: Input supply for ldo5
+    vin6-supply: Input supply for ldo6
+    vin7-supply: Input supply for ldo7
+
+Optional properties:
+- interrupt-parent : Specifies the reference to the interrupt controller.
+- interrupts : IRQ line information.
+- dlg,cs-gpios : Specify a valid GPIO for chip select
+
+Sub-nodes:
+- regulators : This node defines the settings for the regulators.
+  The content of the sub-node is defined by the standard binding
+  for regulators; see regulator.txt.
+
+  The SLG51000 regulators are bound using their names listed below:
+    ldo1
+    ldo2
+    ldo3
+    ldo4
+    ldo5
+    ldo6
+    ldo7
+
+Optional properties for regulators:
+- enable-gpios : Specify a valid GPIO for platform control of the regulator.
+
+Example:
+	pmic: slg51000@75 {
+		compatible = "dlg,slg51000";
+		reg = <0x75>;
+
+		regulators {
+			ldo1 {
+			        regulator-name = "ldo1";
+			        regulator-min-microvolt = <2400000>;
+			        regulator-max-microvolt = <3300000>;
+			};
+
+			ldo2 {
+			        regulator-name = "ldo2";
+			        regulator-min-microvolt = <2400000>;
+			        regulator-max-microvolt = <3300000>;
+			};
+
+			ldo3 {
+			        regulator-name = "ldo3";
+			        regulator-min-microvolt = <1200000>;
+			        regulator-max-microvolt = <3750000>;
+			};
+
+			ldo4 {
+			        regulator-name = "ldo4";
+			        regulator-min-microvolt = <1200000>;
+			        regulator-max-microvolt = <3750000>;
+			};
+
+			ldo5 {
+			        regulator-name = "ldo5";
+			        regulator-min-microvolt = <500000>;
+			        regulator-max-microvolt = <1200000>;
+			};
+
+			ldo6 {
+			        regulator-name = "ldo6";
+			        regulator-min-microvolt = <500000>;
+			        regulator-max-microvolt = <1200000>;
+			};
+
+			ldo7 {
+			        regulator-name = "ldo7";
+			        regulator-min-microvolt = <1200000>;
+			        regulator-max-microvolt = <3750000>;
+			};
+		};
+	};
-- 
2.20.1
