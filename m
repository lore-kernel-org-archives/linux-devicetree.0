From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH v5 2/3] regulator: act8865: add device tree binding doc
Date: Tue, 24 Dec 2013 10:35:14 +0800
Message-ID: <1387852514-18119-1-git-send-email-wenyou.yang@atmel.com>
References: <1387852421-18033-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1387852421-18033-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-doc-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, grant.likely@linaro.org, rob.herring@calxeda.com, plagnioj@jcrosoft.com, nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wenyou.yang@atmel.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---
 .../bindings/regulator/act8865-regulator.txt       |   60 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/act8865-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
new file mode 100644
index 0000000..bef1fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -0,0 +1,60 @@
+ACT8865 regulator
+-------------------
+
+Required properties:
+- compatible: "active-semi,act8865"
+- reg: I2C slave address
+
+Any standard regulator properties can be used to configure the single regulator.
+
+The valid names for regulators are:
+	DCDC_REG1, DCDC_REG2, DCDC_REG3, LDO_REG1, LDO_REG2, LDO_REG3, LDO_REG4.
+
+Example:
+--------
+
+		i2c1: i2c@f0018000 {
+			pmic: act8865@5b {
+				compatible = "active-semi,act8865";
+				reg = <0x5b>;
+				status = "disabled";
+
+				regulators {
+					vcc_1v8_reg: DCDC_REG1 {
+						regulator-name = "VCC_1V8";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+					};
+
+					vcc_1v2_reg: DCDC_REG2 {
+						regulator-name = "VCC_1V2";
+						regulator-min-microvolt = <1100000>;
+						regulator-max-microvolt = <1300000>;
+						regulator-suspend-mem-microvolt = <1150000>;
+						regulator-suspend-standby-microvolt = <1150000>;
+						regulator-always-on;
+					};
+
+					vcc_3v3_reg: DCDC_REG3 {
+						regulator-name = "VCC_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+					};
+
+					vddana_reg: LDO_REG1 {
+						regulator-name = "VDDANA";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+					};
+
+					vddfuse_reg: LDO_REG2 {
+						regulator-name = "FUSE_2V5";
+						regulator-min-microvolt = <2500000>;
+						regulator-max-microvolt = <2500000>;
+					};
+				};
+			};
+		};
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index edbb8d8..519421f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -3,6 +3,7 @@ Device tree binding vendor prefix registry.  Keep list in alphabetical order.
 This isn't an exhaustive list, but you should add new prefixes to it before
 using them to avoid name-space collisions.
 
+active-semi	Active-Semi International Inc
 ad	Avionic Design GmbH
 adi	Analog Devices, Inc.
 aeroflexgaisler	Aeroflex Gaisler AB
-- 
1.7.9.5

