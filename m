From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] regulator: add documentation for ACT8945A's regulator DT bindings
Date: Fri, 8 Jan 2016 10:08:58 +0800
Message-ID: <1452218938-10621-3-git-send-email-wenyou.yang@atmel.com>
References: <1452218938-10621-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452218938-10621-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the DT bindings of the regulator
subdevice of ACT8945A MFD.

Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

 .../bindings/regulator/act8945a-regulator.txt      |   78 ++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/act8945a-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
new file mode 100644
index 0000000..f67ff86
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
@@ -0,0 +1,78 @@
+Device-Tree bindings for regulators of Active-semi ACT8945A Multi-Function Device
+
+Required properties:
+ - compatible: "active-semi,act8945a-regulator"
+
+Optional properties:
+- active-semi,vsel-high: Indicates if the VSEL pin is set to logic-high.
+  If this property is missing, assume the VSEL pin is set to logic-low.
+
+Optional input supply properties:
+  - vp1-supply: The input supply for DCDC_REG1
+  - vp2-supply: The input supply for DCDC_REG2
+  - vp3-supply: The input supply for DCDC_REG3
+  - inl45-supply: The input supply for LDO_REG1 and LDO_REG2
+  - inl67-supply: The input supply for LDO_REG3 and LDO_REG4
+
+Any standard regulator properties can be used to configure the single regulator.
+
+The valid names for regulators are:
+	DCDC_REG1, DCDC_REG2, DCDC_REG3, LDO_REG1, LDO_REG2, LDO_REG3, LDO_REG4.
+
+Example:
+
+	pmic {
+		compatible = "active-semi,act8945a-regulator";
+		active-semi,vsel-high;
+
+		regulators {
+			vdd_1v35_reg: DCDC_REG1 {
+				regulator-name = "VDD_1V35";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+			};
+
+			vdd_1v2_reg: DCDC_REG2 {
+				regulator-name = "VDD_1V2";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+
+			vdd_3v3_reg: DCDC_REG3 {
+				regulator-name = "VDD_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_fuse_reg: LDO_REG1 {
+				regulator-name = "VDD_FUSE";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+
+			vdd_3v3_lp_reg: LDO_REG2 {
+				regulator-name = "VDD_3V3_LP";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_led_reg: LDO_REG3 {
+				regulator-name = "VDD_LED";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_sdhc_1v8_reg: LDO_REG4 {
+				regulator-name = "VDD_SDHC_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
