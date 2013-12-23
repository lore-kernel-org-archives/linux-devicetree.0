From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/3] regulator: act8865: add device tree binding doc
Date: Mon, 23 Dec 2013 13:26:15 +0800
Message-ID: <1387776375-23118-1-git-send-email-wenyou.yang@atmel.com>
References: <1387776268-23036-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387776268-23036-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 .../bindings/regulator/act8865-regulator.txt       |   60 ++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/act8865-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
new file mode 100644
index 0000000..76964fe
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
+					vddfuse_reg: LDO_REG1 {
+						regulator-name = "VDDANA";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+					};
+
+					vddana_reg: LDO_REG2 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
