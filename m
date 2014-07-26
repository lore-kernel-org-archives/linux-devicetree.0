From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 10/15] ARM: dts: rockchip: add tps65910 regulator for bqcurie2
Date: Sun, 27 Jul 2014 01:18:26 +0200
Message-ID: <1406416711-28006-11-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Curie2 uses a tps659102 as its main pmic, so add the i2c1 and tps65910
node as well as define the used voltages and regulator-names according to
the schematics.

Also fix the supply of the sd0 regulator, as it is supplied by the vio reg.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a-bqcurie2.dts | 87 ++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
index 38910f6..8b479f7 100644
--- a/arch/arm/boot/dts/rk3066a-bqcurie2.dts
+++ b/arch/arm/boot/dts/rk3066a-bqcurie2.dts
@@ -31,6 +31,7 @@
 		regulator-max-microvolt = <3000000>;
 		gpio = <&gpio3 7 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <100000>;
+		vin-supply = <&vcc_io>;
 	};
 
 	gpio-keys {
@@ -59,6 +60,92 @@
 	};
 };
 
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	tps: tps@2d {
+		reg = <0x2d>;
+
+		interrupt-parent = <&gpio6>;
+		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc5-supply = <&vcc_io>;
+		vcc6-supply = <&vcc_io>;
+
+		regulators {
+			vcc_rtc: regulator@0 {
+				regulator-name = "vcc_rtc";
+				regulator-always-on;
+			};
+
+			vcc_io: regulator@1 {
+				regulator-name = "vcc_io";
+				regulator-always-on;
+			};
+
+			vdd_arm: regulator@2 {
+				regulator-name = "vdd_arm";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vcc_ddr: regulator@3 {
+				regulator-name = "vcc_ddr";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			vcc18_cif: regulator@5 {
+				regulator-name = "vcc18_cif";
+				regulator-always-on;
+			};
+
+			vdd_11: regulator@6 {
+				regulator-name = "vdd_11";
+				regulator-always-on;
+			};
+
+			vcc_25: regulator@7 {
+				regulator-name = "vcc_25";
+				regulator-always-on;
+			};
+
+			vcc_18: regulator@8 {
+				regulator-name = "vcc_18";
+				regulator-always-on;
+			};
+
+			vcc25_hdmi: regulator@9 {
+				regulator-name = "vcc25_hdmi";
+				regulator-always-on;
+			};
+
+			vcca_33: regulator@10 {
+				regulator-name = "vcca_33";
+				regulator-always-on;
+			};
+
+			vcc_tp: regulator@11 {
+				regulator-name = "vcc_tp";
+				regulator-always-on;
+			};
+
+			vcc28_cif: regulator@12 {
+				regulator-name = "vcc28_cif";
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+/* must be included after &tps gets defined */
+#include "tps65910.dtsi"
+
 &mmc0 { /* sdmmc */
 	num-slots = <1>;
 	status = "okay";
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
