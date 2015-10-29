From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: imx: Add support for Advantech/GE Bx50v3
Date: Thu, 29 Oct 2015 19:16:44 -0400
Message-ID: <1446160607-16053-4-git-send-email-akshay.bhat@timesys.com>
References: <1446160607-16053-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446160607-16053-1-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Justin Waters <justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>

Advantech has 3 carrier boards (B450v3, B650v3, B850v3) which use
the Advantech BA-16 module (based on iMX6D). This file has the
devicetree entries that are common to all 3 boards.

Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 206 ++++++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-bx50v3.dtsi

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
new file mode 100644
index 0000000..e9d97ee
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -0,0 +1,206 @@
+/*
+ * Copyright 2015 Timesys Corporation.
+ * Copyright 2015 GE Healthcare.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "imx6q-ba16.dtsi"
+
+/ {
+	regulators {
+		/* regulator for wl18xx on sdhc4 */
+		wl18xx_vmmc: regulator@6 {
+			compatible = "regulator-fixed";
+			regulator-name = "vwl1807";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&pca9539 3 GPIO_ACTIVE_HIGH>;
+			startup-delay-us = <70000>;
+			enable-active-high;
+		};
+
+		reg_wlan: regulator@7 {
+			compatible = "regulator-fixed";
+			regulator-name = "3P3V_wlan";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			gpio = <&gpio6 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "fsl,imx6q-ba16-sgtl5000",
+			     "fsl,imx-audio-sgtl5000";
+		model = "imx6q-ba16-sgtl5000";
+		ssi-controller = <&ssi1>;
+		audio-codec = <&codec>;
+		audio-routing =
+			"MIC_IN", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"LINE_IN", "Line In Jack",
+			"Headphone Jack", "HP_OUT";
+		mux-int-port = <1>;
+		mux-ext-port = <4>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mclk: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <22000000>;
+		};
+	};
+};
+
+&i2c1 {
+	pca9547: mux@70 {
+		compatible = "nxp,pca9547";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mux_i2c3: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			ads7830: ads7830@48 {
+				compatible = "ti,ads7830";
+				reg = <0x48>;
+			};
+		};
+
+		mux_i2c4: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			eeprom: eeprom@50 {
+				compatible = "atmel,24c08";
+				reg = <0x50>;
+			};
+
+			mpl3115: mpl3115@60 {
+				compatible = "fsl,mpl3115";
+				reg = <0x60>;
+			};
+		};
+
+		mux_i2c5: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+		};
+
+		mux_i2c6: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			codec: sgtl5000@0a {
+				compatible = "fsl,sgtl5000";
+				reg = <0x0a>;
+				clocks = <&mclk>;
+				VDDA-supply = <&reg_1p8v>;
+				VDDIO-supply = <&reg_3p3v>;
+			};
+		};
+
+		mux_i2c7: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x4>;
+
+			pca9539: pca9539@74 {
+				compatible = "nxp,pca9539";
+				reg = <0x74>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&gpio2>;
+				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+			};
+		};
+
+		mux_i2c8: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x5>;
+
+			igb@49 {
+				compatible = "intel,igb";
+				reg = <0x49>;
+			};
+
+			igb@61 {
+				compatible = "intel,igb";
+				reg = <0x61>;
+			};
+		};
+
+		mux_i2c9: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
+
+		mux_i2c10: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+		};
+	};
+};
+
+
+&usdhc4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc4>;
+	bus-width = <4>;
+	vmmc-supply = <&wl18xx_vmmc>;
+	no-1-8-v;
+	non-removable;
+	enable-sdio-wakeup;
+	keep-power-in-suspend;
+	cap-power-off-card;
+	max-frequency = <25000000>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@0 {
+		compatible = "ti,wl1837";
+		reg = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+		tcxo-clock-frequency = <26000000>;
+	};
+};
+
+&ecspi5 {
+	fsl,spi-num-chipselects = <1>;
+	cs-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi5>;
+	status = "okay";
+
+	m25_eeprom: m25p80@0 {
+		compatible = "atmel,at25";
+		spi-max-frequency = <20000000>;
+		size = <0x8000>;
+		pagesize = <64>;
+		reg = <0>;
+		address-width = <16>;
+	};
+};
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
