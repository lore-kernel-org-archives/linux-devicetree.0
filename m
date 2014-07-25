From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v3 7/8] ARM: dts: add rk3288 evaluation board
Date: Fri, 25 Jul 2014 23:49:39 +0200
Message-ID: <1406324980-2450-8-git-send-email-heiko@sntech.de>
References: <1406324980-2450-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406324980-2450-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There exist 2 variants using either the act8846 or rk808 as pmic, while the
rest of the board stays the same.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/rk3288-evb-act8846.dts | 134 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-evb-rk808.dts   |  18 +++++
 arch/arm/boot/dts/rk3288-evb.dtsi        |  74 +++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-evb-act8846.dts
 create mode 100644 arch/arm/boot/dts/rk3288-evb-rk808.dts
 create mode 100644 arch/arm/boot/dts/rk3288-evb.dtsi

diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts b/arch/arm/boot/dts/rk3288-evb-act8846.dts
new file mode 100644
index 0000000..7d59ff4
--- /dev/null
+++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
@@ -0,0 +1,134 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "rk3288-evb.dtsi"
+
+/ {
+	compatible = "rockchip,rk3288-evb-act8846", "rockchip,rk3288";
+};
+
+&i2c0 {
+	hym8563@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+
+		#clock-cells = <0>;
+		clock-output-names = "xin32k";
+	};
+
+	act8846: act8846@5a {
+		compatible = "active-semi,act8846";
+		reg = <0x5a>;
+		status = "okay";
+
+		regulators {
+			vcc_ddr: REG1 {
+				regulator-name = "VCC_DDR";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vcc_io: REG2 {
+				regulator-name = "VCC_IO";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_log: REG3 {
+				regulator-name = "VDD_LOG";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			vcc_20: REG4 {
+				regulator-name = "VCC_20";
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-always-on;
+			};
+
+			vccio_sd: REG5 {
+				regulator-name = "VCCIO_SD";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd10_lcd: REG6 {
+				regulator-name = "VDD10_LCD";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			vcca_codec: REG7 {
+				regulator-name = "VCCA_CODEC";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vcca_tp: REG8 {
+				regulator-name = "VCCA_TP";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vccio_pmu: REG9 {
+				regulator-name = "VCCIO_PMU";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_10: REG10 {
+				regulator-name = "VDD_10";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+			};
+
+			vcc_18: REG11 {
+				regulator-name = "VCC_18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcc18_lcd: REG12 {
+				regulator-name = "VCC18_LCD";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts b/arch/arm/boot/dts/rk3288-evb-rk808.dts
new file mode 100644
index 0000000..9a88b6c
--- /dev/null
+++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
@@ -0,0 +1,18 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "rk3288-evb.dtsi"
+
+/ {
+	compatible = "rockchip,rk3288-evb-rk808", "rockchip,rk3288";
+};
diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
new file mode 100644
index 0000000..749e20d
--- /dev/null
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -0,0 +1,74 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "rk3288.dtsi"
+
+/ {
+	memory {
+		reg = <0x0 0x80000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwrbtn>;
+
+		button@0 {
+			gpios = <&gpio0 5 GPIO_ACTIVE_LOW>;
+			linux,code = <116>;
+			label = "GPIO Key Power";
+			linux,input-type = <1>;
+			gpio-key,wakeup = <1>;
+			debounce-interval = <100>;
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&pinctrl {
+	buttons {
+		pwrbtn: pwrbtn {
+			rockchip,pins = <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
