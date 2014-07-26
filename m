From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 11/15] ARM: dts: add i2c and regulator nodes to rk3188-radxarock
Date: Sun, 27 Jul 2014 01:18:27 +0200
Message-ID: <1406416711-28006-12-git-send-email-heiko@sntech.de>
References: <1406416711-28006-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406416711-28006-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This enables the 2nd i2c bus and adds the act8846 pmic as device.

Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3188-radxarock.dts | 112 +++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts b/arch/arm/boot/dts/rk3188-radxarock.dts
index 241e2a4..a281293 100644
--- a/arch/arm/boot/dts/rk3188-radxarock.dts
+++ b/arch/arm/boot/dts/rk3188-radxarock.dts
@@ -59,6 +59,118 @@
 	};
 };
 
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	act8846: act8846@5a {
+		compatible = "active-semi,act8846";
+		reg = <0x5a>;
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&act8846_dvs0_ctl>;
+
+		regulators {
+			vcc_ddr: REG1 {
+				regulator-name = "VCC_DDR";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vdd_log: REG2 {
+				regulator-name = "VDD_LOG";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			vdd_arm: REG3 {
+				regulator-name = "VDD_ARM";
+				regulator-min-microvolt = <875000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+			};
+
+			vcc_io: REG4 {
+				regulator-name = "VCC_IO";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_10: REG5 {
+				regulator-name = "VDD_10";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			vdd_hdmi: REG6 {
+				regulator-name = "VDD_HDMI";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-always-on;
+			};
+
+			vcc18: REG7 {
+				regulator-name = "VCC_18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcca_33: REG8 {
+				regulator-name = "VCCA_33";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vcc_rmii: REG9 {
+				regulator-name = "VCC_RMII";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vccio_wl: REG10 {
+				regulator-name = "VCCIO_WL";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vcc_18: REG11 {
+				regulator-name = "VCC18_IO";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcc28: REG12 {
+				regulator-name = "VCC_28";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pcfg_output_low: pcfg-output-low {
+		output-low;
+	};
+
+	act8846 {
+		act8846_dvs0_ctl: act8846-dvs0-ctl {
+			rockchip,pins = <RK_GPIO3 27 RK_FUNC_GPIO &pcfg_output_low>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
