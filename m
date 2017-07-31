From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 13/14] ARM: dts: rockchip: add pmic rk805 dt node for rv1108 evb
Date: Mon, 31 Jul 2017 18:20:34 +0800
Message-ID: <1501496434-22122-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501495449-21290-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

RK805 is used as the voltage regulator on rv1108 evaluation
board. Add device tree node for it.

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rv1108-evb.dts | 108 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 8a5a88f..5675975 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -93,6 +93,114 @@
 			248 249 250 251 252 253 254 255>;
 		default-brightness-level = <200>;
 	};
+
+	vcc_sys: vsys-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	i2c-scl-rising-time-ns = <275>;
+	i2c-scl-falling-time-ns = <16>;
+	clock-frequency = <400000>;
+
+	rk805: pmic@18 {
+		compatible = "rockchip,rk805";
+		reg = <0x18>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_LOW>;
+		rockchip,system-power-controller;
+
+		vcc1-supply = <&vcc_sys>;
+		vcc2-supply = <&vcc_sys>;
+		vcc3-supply = <&vcc_sys>;
+		vcc4-supply = <&vcc_sys>;
+		vcc5-supply = <&vcc_sys>;
+		vcc6-supply = <&vcc_sys>;
+
+		regulators {
+			vdd_core: DCDC_REG1 {
+				regulator-name= "vdd_core";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-enabled;
+					regulator-state-uv = <900000>;
+				};
+			};
+
+			vdd_cam: DCDC_REG2 {
+				regulator-name= "vdd_cam";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-state-mem {
+					regulator-state-disabled;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name= "vcc_ddr";
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-enabled;
+				};
+			};
+
+			vcc_io: DCDC_REG4 {
+				regulator-name= "vcc_io";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-enabled;
+					regulator-state-uv = <3300000>;
+				};
+			};
+
+			vdd_10: LDO_REG1 {
+				regulator-name= "vdd_10";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-disabled;
+				};
+			};
+
+			vcc_18: LDO_REG2 {
+				regulator-name= "vcc_18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-disabled;
+				};
+			};
+
+			vdd10_pmu: LDO_REG3 {
+				regulator-name= "vdd10_pmu";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-state-mem {
+					regulator-state-enabled;
+					regulator-state-uv = <1000000>;
+				};
+			};
+		};
+	};
 };
 
 &pwm0 {
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
