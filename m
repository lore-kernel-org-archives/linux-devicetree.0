From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] arm64: dts: hisilicon: hikey970: Add SD and WiFi support
Date: Thu, 28 Feb 2019 21:15:11 +0530
Message-ID: <20190228154511.17566-4-manivannan.sadhasivam@linaro.org>
References: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add SD and WiFi support for HiKey970 board based on HI3670 SoC. Due to
the absence of the PMIC driver, fixed regulators are sourced to make the
driver working.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  75 ++++++++++++
 .../boot/dts/hisilicon/hikey970-pinctrl.dtsi  | 115 ++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
index c9775b66629f..7dac33d4fd5c 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
@@ -8,6 +8,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
 
 #include "hi3670.dtsi"
 #include "hikey970-pinctrl.dtsi"
@@ -17,6 +18,8 @@
 	compatible = "hisilicon,hi3670-hikey970", "hisilicon,hi3670";
 
 	aliases {
+		mshc1 = &dwmmc1;
+		mshc2 = &dwmmc2;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -35,6 +38,37 @@
 		/* expect bootloader to fill in this region */
 		reg = <0x0 0x0 0x0 0x0>;
 	};
+
+	sd_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	wlan_en: wlan-en-1-8v {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		/* GPIO_051_WIFI_EN */
+		gpio = <&gpio6 3 0>;
+
+		/* WLAN card specific delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
 };
 
 /*
@@ -354,6 +388,47 @@
 		"GPIO_231_HDMI_INT";
 };
 
+&dwmmc1 {
+	bus-width = <0x4>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	cap-sd-highspeed;
+	disable-wp;
+	cd-inverted;
+	cd-gpios = <&gpio25 5 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd_pmx_func
+		     &sd_clk_cfg_func
+		     &sd_cfg_func>;
+	vmmc-supply = <&sd_3v3>;
+	vqmmc-supply = <&sd_1v8>;
+	status = "okay";
+};
+
+&dwmmc2 { /* WIFI */
+	bus-width = <0x4>;
+	non-removable;
+	broken-cd;
+	cap-power-off-card;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio_pmx_func
+		     &sdio_clk_cfg_func
+		     &sdio_cfg_func>;
+	/* WL_EN */
+	vmmc-supply = <&wlan_en>;
+	status = "ok";
+
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1837";
+		reg = <2>;      /* sdio func num */
+		/* WL_IRQ, GPIO_177_WL_WAKEUP_AP */
+		interrupt-parent = <&gpio22>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+	};
+};
+
 &uart0 {
 	/* On High speed expansion header */
 	label = "HS-UART0";
diff --git a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
index 67bb52d43619..d456b0aa6f58 100644
--- a/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hikey970-pinctrl.dtsi
@@ -196,6 +196,16 @@
 			/* pin base, nr pins & gpio function */
 			pinctrl-single,gpio-range = <&range 0 10 0>;
 
+			sdio_pmx_func: sdio_pmx_func {
+				pinctrl-single,pins = <
+					0x000 MUX_M1 /* SDIO_CLK */
+					0x004 MUX_M1 /* SDIO_CMD */
+					0x008 MUX_M1 /* SDIO_DATA0 */
+					0x00c MUX_M1 /* SDIO_DATA1 */
+					0x010 MUX_M1 /* SDIO_DATA2 */
+					0x014 MUX_M1 /* SDIO_DATA3 */
+				>;
+			};
 		};
 
 		pmx6: pinmux@fc182800 {
@@ -203,6 +213,52 @@
 			reg = <0x0 0xfc182800 0x0 0x028>;
 			#pinctrl-cells = <1>;
 			pinctrl-single,register-width = <0x20>;
+
+			sdio_clk_cfg_func: sdio_clk_cfg_func {
+				pinctrl-single,pins = <
+					0x000 0x0 /* SDIO_CLK */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE6_32MA DRIVE6_MASK
+				>;
+			};
+
+			sdio_cfg_func: sdio_cfg_func {
+				pinctrl-single,pins = <
+					0x004 0x0 /* SDIO_CMD */
+					0x008 0x0 /* SDIO_DATA0 */
+					0x00c 0x0 /* SDIO_DATA1 */
+					0x010 0x0 /* SDIO_DATA2 */
+					0x014 0x0 /* SDIO_DATA3 */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_UP
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE6_19MA DRIVE6_MASK
+				>;
+			};
 		};
 
 		pmx7: pinmux@ff37e000 {
@@ -214,6 +270,17 @@
 			pinctrl-single,function-mask = <7>;
 			/* pin base, nr pins & gpio function */
 			pinctrl-single,gpio-range = <&range 0 12 0>;
+
+			sd_pmx_func: sd_pmx_func {
+				pinctrl-single,pins = <
+					0x000 MUX_M1 /* SD_CLK */
+					0x004 MUX_M1 /* SD_CMD */
+					0x008 MUX_M1 /* SD_DATA0 */
+					0x00c MUX_M1 /* SD_DATA1 */
+					0x010 MUX_M1 /* SD_DATA2 */
+					0x014 MUX_M1 /* SD_DATA3 */
+				>;
+			};
 		};
 
 		pmx8: pinmux@ff37e800 {
@@ -221,6 +288,54 @@
 			reg = <0x0 0xff37e800 0x0 0x030>;
 			#pinctrl-cells = <1>;
 			pinctrl-single,register-width = <0x20>;
+
+			sd_clk_cfg_func: sd_clk_cfg_func {
+				pinctrl-single,pins = <
+					0x000 0x0 /* SD_CLK */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_DIS
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE6_32MA
+					DRIVE6_MASK
+				>;
+			};
+
+			sd_cfg_func: sd_cfg_func {
+				pinctrl-single,pins = <
+					0x004 0x0 /* SD_CMD */
+					0x008 0x0 /* SD_DATA0 */
+					0x00c 0x0 /* SD_DATA1 */
+					0x010 0x0 /* SD_DATA2 */
+					0x014 0x0 /* SD_DATA3 */
+				>;
+				pinctrl-single,bias-pulldown = <
+					PULL_DIS
+					PULL_DOWN
+					PULL_DIS
+					PULL_DOWN
+				>;
+				pinctrl-single,bias-pullup = <
+					PULL_UP
+					PULL_UP
+					PULL_DIS
+					PULL_UP
+				>;
+				pinctrl-single,drive-strength = <
+					DRIVE6_19MA
+					DRIVE6_MASK
+				>;
+			};
 		};
 
 		pmx1: pinmux@fff11000 {
-- 
2.17.1
