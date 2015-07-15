From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 2/7] ARM: dt: Add PMU node, making PMU child devices childs of
 this node
Date: Wed, 15 Jul 2015 19:59:31 +0100
Message-ID: <E1ZFRtz-0003m0-Jf@rmk-PC.arm.linux.org.uk>
References: <20150715185859.GC7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150715185859.GC7557-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the PMU node, and move the child devices of the PMU node beneath
this new node, giving it a "simple-bus" so that the OF platform
device creator will create these child devices.  No functional change
from this is expected.

The PMU provides multiple features, including an interrupt, reset,
power and isolation controller.

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/dove.dtsi | 590 +++++++++++++++++++++++---------------------
 1 file changed, 304 insertions(+), 286 deletions(-)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 9ad829523a13..4f20278f2a20 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -383,293 +383,311 @@
 				status = "disabled";
 			};
 
-			thermal: thermal-diode@d001c {
-				compatible = "marvell,dove-thermal";
-				reg = <0xd001c 0x0c>, <0xd005c 0x08>;
-			};
-
-			gate_clk: clock-gating-ctrl@d0038 {
-				compatible = "marvell,dove-gating-clock";
-				reg = <0xd0038 0x4>;
-				clocks = <&core_clk 0>;
-				#clock-cells = <1>;
-			};
-
-			pinctrl: pin-ctrl@d0200 {
-				compatible = "marvell,dove-pinctrl";
-				reg = <0xd0200 0x14>,
-				      <0xd0440 0x04>;
-				clocks = <&gate_clk 22>;
-
-				pmx_gpio_0: pmx-gpio-0 {
-					marvell,pins = "mpp0";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_1: pmx-gpio-1 {
-					marvell,pins = "mpp1";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_2: pmx-gpio-2 {
-					marvell,pins = "mpp2";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_3: pmx-gpio-3 {
-					marvell,pins = "mpp3";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_4: pmx-gpio-4 {
-					marvell,pins = "mpp4";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_5: pmx-gpio-5 {
-					marvell,pins = "mpp5";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_6: pmx-gpio-6 {
-					marvell,pins = "mpp6";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_7: pmx-gpio-7 {
-					marvell,pins = "mpp7";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_8: pmx-gpio-8 {
-					marvell,pins = "mpp8";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_9: pmx-gpio-9 {
-					marvell,pins = "mpp9";
-					marvell,function = "gpio";
-				};
-
-				pmx_pcie1_clkreq: pmx-pcie1-clkreq {
-					marvell,pins = "mpp9";
-					marvell,function = "pex1";
-				};
-
-				pmx_gpio_10: pmx-gpio-10 {
-					marvell,pins = "mpp10";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_11: pmx-gpio-11 {
-					marvell,pins = "mpp11";
-					marvell,function = "gpio";
-				};
-
-				pmx_pcie0_clkreq: pmx-pcie0-clkreq {
-					marvell,pins = "mpp11";
-					marvell,function = "pex0";
-				};
-
-				pmx_gpio_12: pmx-gpio-12 {
-					marvell,pins = "mpp12";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_13: pmx-gpio-13 {
-					marvell,pins = "mpp13";
-					marvell,function = "gpio";
-				};
-
-				pmx_audio1_extclk: pmx-audio1-extclk {
-					marvell,pins = "mpp13";
-					marvell,function = "audio1";
-				};
-
-				pmx_gpio_14: pmx-gpio-14 {
-					marvell,pins = "mpp14";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_15: pmx-gpio-15 {
-					marvell,pins = "mpp15";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_16: pmx-gpio-16 {
-					marvell,pins = "mpp16";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_17: pmx-gpio-17 {
-					marvell,pins = "mpp17";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_18: pmx-gpio-18 {
-					marvell,pins = "mpp18";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_19: pmx-gpio-19 {
-					marvell,pins = "mpp19";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_20: pmx-gpio-20 {
-					marvell,pins = "mpp20";
-					marvell,function = "gpio";
-				};
-
-				pmx_gpio_21: pmx-gpio-21 {
-					marvell,pins = "mpp21";
-					marvell,function = "gpio";
-				};
-
-				pmx_camera: pmx-camera {
-					marvell,pins = "mpp_camera";
-					marvell,function = "camera";
-				};
-
-				pmx_camera_gpio: pmx-camera-gpio {
-					marvell,pins = "mpp_camera";
-					marvell,function = "gpio";
-				};
-
-				pmx_sdio0: pmx-sdio0 {
-					marvell,pins = "mpp_sdio0";
-					marvell,function = "sdio0";
-				};
-
-				pmx_sdio0_gpio: pmx-sdio0-gpio {
-					marvell,pins = "mpp_sdio0";
-					marvell,function = "gpio";
-				};
-
-				pmx_sdio1: pmx-sdio1 {
-					marvell,pins = "mpp_sdio1";
-					marvell,function = "sdio1";
-				};
-
-				pmx_sdio1_gpio: pmx-sdio1-gpio {
-					marvell,pins = "mpp_sdio1";
-					marvell,function = "gpio";
-				};
-
-				pmx_audio1_gpio: pmx-audio1-gpio {
-					marvell,pins = "mpp_audio1";
-					marvell,function = "gpio";
-				};
-
-				pmx_audio1_i2s1_spdifo: pmx-audio1-i2s1-spdifo {
-					marvell,pins = "mpp_audio1";
-					marvell,function = "i2s1/spdifo";
-				};
-
-				pmx_spi0: pmx-spi0 {
-					marvell,pins = "mpp_spi0";
-					marvell,function = "spi0";
-				};
-
-				pmx_spi0_gpio: pmx-spi0-gpio {
-					marvell,pins = "mpp_spi0";
-					marvell,function = "gpio";
-				};
-
-				pmx_spi1_4_7: pmx-spi1-4-7 {
-					marvell,pins = "mpp4", "mpp5",
-						"mpp6", "mpp7";
-					marvell,function = "spi1";
-				};
-
-				pmx_spi1_20_23: pmx-spi1-20-23 {
-					marvell,pins = "mpp20", "mpp21",
-						"mpp22", "mpp23";
-					marvell,function = "spi1";
-				};
-
-				pmx_uart1: pmx-uart1 {
-					marvell,pins = "mpp_uart1";
-					marvell,function = "uart1";
-				};
-
-				pmx_uart1_gpio: pmx-uart1-gpio {
-					marvell,pins = "mpp_uart1";
-					marvell,function = "gpio";
-				};
-
-				pmx_nand: pmx-nand {
-					marvell,pins = "mpp_nand";
-					marvell,function = "nand";
-				};
-
-				pmx_nand_gpo: pmx-nand-gpo {
-					marvell,pins = "mpp_nand";
-					marvell,function = "gpo";
-				};
-
-				pmx_i2c1: pmx-i2c1 {
-					marvell,pins = "mpp17", "mpp19";
-					marvell,function = "twsi";
-				};
-
-				pmx_i2c2: pmx-i2c2 {
-					marvell,pins = "mpp_audio1";
-					marvell,function = "twsi";
-				};
-
-				pmx_ssp_i2c2: pmx-ssp-i2c2 {
-					marvell,pins = "mpp_audio1";
-					marvell,function = "ssp/twsi";
-				};
-
-				pmx_i2cmux_0: pmx-i2cmux-0 {
-					marvell,pins = "twsi";
-					marvell,function = "twsi-opt1";
-				};
-
-				pmx_i2cmux_1: pmx-i2cmux-1 {
-					marvell,pins = "twsi";
-					marvell,function = "twsi-opt2";
-				};
-
-				pmx_i2cmux_2: pmx-i2cmux-2 {
-					marvell,pins = "twsi";
-					marvell,function = "twsi-opt3";
-				};
-			};
-
-			core_clk: core-clocks@d0214 {
-				compatible = "marvell,dove-core-clock";
-				reg = <0xd0214 0x4>;
-				#clock-cells = <1>;
-			};
-
-			gpio0: gpio-ctrl@d0400 {
-				compatible = "marvell,orion-gpio";
-				#gpio-cells = <2>;
-				gpio-controller;
-				reg = <0xd0400 0x20>;
-				ngpios = <32>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <12>, <13>, <14>, <60>;
-			};
-
-			gpio1: gpio-ctrl@d0420 {
-				compatible = "marvell,orion-gpio";
-				#gpio-cells = <2>;
-				gpio-controller;
-				reg = <0xd0420 0x20>;
-				ngpios = <32>;
+			pmu: power-management@d0000 {
+				compatible = "marvell,dove-pmu", "simple-bus";
+				reg = <0xd0000 0x8000>, <0xd8000 0x8000>;
+				ranges = <0x00000000 0x000d0000 0x8000
+					  0x00008000 0x000d8000 0x8000>;
+				interrupts = <33>;
 				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupts = <61>;
-			};
-
-			rtc: real-time-clock@d8500 {
-				compatible = "marvell,orion-rtc";
-				reg = <0xd8500 0x20>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				#interrupt-cells = <1>;
+				#reset-cells = <1>;
+
+				domains {
+				};
+
+				thermal: thermal-diode@001c {
+					compatible = "marvell,dove-thermal";
+					reg = <0x001c 0x0c>, <0x005c 0x08>;
+				};
+
+				gate_clk: clock-gating-ctrl@0038 {
+					compatible = "marvell,dove-gating-clock";
+					reg = <0x0038 0x4>;
+					clocks = <&core_clk 0>;
+					#clock-cells = <1>;
+				};
+
+				pinctrl: pin-ctrl@0200 {
+					compatible = "marvell,dove-pinctrl";
+					reg = <0x0200 0x14>,
+					      <0x0440 0x04>;
+					clocks = <&gate_clk 22>;
+
+					pmx_gpio_0: pmx-gpio-0 {
+						marvell,pins = "mpp0";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_1: pmx-gpio-1 {
+						marvell,pins = "mpp1";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_2: pmx-gpio-2 {
+						marvell,pins = "mpp2";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_3: pmx-gpio-3 {
+						marvell,pins = "mpp3";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_4: pmx-gpio-4 {
+						marvell,pins = "mpp4";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_5: pmx-gpio-5 {
+						marvell,pins = "mpp5";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_6: pmx-gpio-6 {
+						marvell,pins = "mpp6";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_7: pmx-gpio-7 {
+						marvell,pins = "mpp7";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_8: pmx-gpio-8 {
+						marvell,pins = "mpp8";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_9: pmx-gpio-9 {
+						marvell,pins = "mpp9";
+						marvell,function = "gpio";
+					};
+
+					pmx_pcie1_clkreq: pmx-pcie1-clkreq {
+						marvell,pins = "mpp9";
+						marvell,function = "pex1";
+					};
+
+					pmx_gpio_10: pmx-gpio-10 {
+						marvell,pins = "mpp10";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_11: pmx-gpio-11 {
+						marvell,pins = "mpp11";
+						marvell,function = "gpio";
+					};
+
+					pmx_pcie0_clkreq: pmx-pcie0-clkreq {
+						marvell,pins = "mpp11";
+						marvell,function = "pex0";
+					};
+
+					pmx_gpio_12: pmx-gpio-12 {
+						marvell,pins = "mpp12";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_13: pmx-gpio-13 {
+						marvell,pins = "mpp13";
+						marvell,function = "gpio";
+					};
+
+					pmx_audio1_extclk: pmx-audio1-extclk {
+						marvell,pins = "mpp13";
+						marvell,function = "audio1";
+					};
+
+					pmx_gpio_14: pmx-gpio-14 {
+						marvell,pins = "mpp14";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_15: pmx-gpio-15 {
+						marvell,pins = "mpp15";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_16: pmx-gpio-16 {
+						marvell,pins = "mpp16";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_17: pmx-gpio-17 {
+						marvell,pins = "mpp17";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_18: pmx-gpio-18 {
+						marvell,pins = "mpp18";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_19: pmx-gpio-19 {
+						marvell,pins = "mpp19";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_20: pmx-gpio-20 {
+						marvell,pins = "mpp20";
+						marvell,function = "gpio";
+					};
+
+					pmx_gpio_21: pmx-gpio-21 {
+						marvell,pins = "mpp21";
+						marvell,function = "gpio";
+					};
+
+					pmx_camera: pmx-camera {
+						marvell,pins = "mpp_camera";
+						marvell,function = "camera";
+					};
+
+					pmx_camera_gpio: pmx-camera-gpio {
+						marvell,pins = "mpp_camera";
+						marvell,function = "gpio";
+					};
+
+					pmx_sdio0: pmx-sdio0 {
+						marvell,pins = "mpp_sdio0";
+						marvell,function = "sdio0";
+					};
+
+					pmx_sdio0_gpio: pmx-sdio0-gpio {
+						marvell,pins = "mpp_sdio0";
+						marvell,function = "gpio";
+					};
+
+					pmx_sdio1: pmx-sdio1 {
+						marvell,pins = "mpp_sdio1";
+						marvell,function = "sdio1";
+					};
+
+					pmx_sdio1_gpio: pmx-sdio1-gpio {
+						marvell,pins = "mpp_sdio1";
+						marvell,function = "gpio";
+					};
+
+					pmx_audio1_gpio: pmx-audio1-gpio {
+						marvell,pins = "mpp_audio1";
+						marvell,function = "gpio";
+					};
+
+					pmx_audio1_i2s1_spdifo: pmx-audio1-i2s1-spdifo {
+						marvell,pins = "mpp_audio1";
+						marvell,function = "i2s1/spdifo";
+					};
+
+					pmx_spi0: pmx-spi0 {
+						marvell,pins = "mpp_spi0";
+						marvell,function = "spi0";
+					};
+
+					pmx_spi0_gpio: pmx-spi0-gpio {
+						marvell,pins = "mpp_spi0";
+						marvell,function = "gpio";
+					};
+
+					pmx_spi1_4_7: pmx-spi1-4-7 {
+						marvell,pins = "mpp4", "mpp5",
+							"mpp6", "mpp7";
+						marvell,function = "spi1";
+					};
+
+					pmx_spi1_20_23: pmx-spi1-20-23 {
+						marvell,pins = "mpp20", "mpp21",
+							"mpp22", "mpp23";
+						marvell,function = "spi1";
+					};
+
+					pmx_uart1: pmx-uart1 {
+						marvell,pins = "mpp_uart1";
+						marvell,function = "uart1";
+					};
+
+					pmx_uart1_gpio: pmx-uart1-gpio {
+						marvell,pins = "mpp_uart1";
+						marvell,function = "gpio";
+					};
+
+					pmx_nand: pmx-nand {
+						marvell,pins = "mpp_nand";
+						marvell,function = "nand";
+					};
+
+					pmx_nand_gpo: pmx-nand-gpo {
+						marvell,pins = "mpp_nand";
+						marvell,function = "gpo";
+					};
+
+					pmx_i2c1: pmx-i2c1 {
+						marvell,pins = "mpp17", "mpp19";
+						marvell,function = "twsi";
+					};
+
+					pmx_i2c2: pmx-i2c2 {
+						marvell,pins = "mpp_audio1";
+						marvell,function = "twsi";
+					};
+
+					pmx_ssp_i2c2: pmx-ssp-i2c2 {
+						marvell,pins = "mpp_audio1";
+						marvell,function = "ssp/twsi";
+					};
+
+					pmx_i2cmux_0: pmx-i2cmux-0 {
+						marvell,pins = "twsi";
+						marvell,function = "twsi-opt1";
+					};
+
+					pmx_i2cmux_1: pmx-i2cmux-1 {
+						marvell,pins = "twsi";
+						marvell,function = "twsi-opt2";
+					};
+
+					pmx_i2cmux_2: pmx-i2cmux-2 {
+						marvell,pins = "twsi";
+						marvell,function = "twsi-opt3";
+					};
+				};
+
+				core_clk: core-clocks@0214 {
+					compatible = "marvell,dove-core-clock";
+					reg = <0x0214 0x4>;
+					#clock-cells = <1>;
+				};
+
+				gpio0: gpio-ctrl@0400 {
+					compatible = "marvell,orion-gpio";
+					#gpio-cells = <2>;
+					gpio-controller;
+					reg = <0x0400 0x20>;
+					ngpios = <32>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupt-parent = <&intc>;
+					interrupts = <12>, <13>, <14>, <60>;
+				};
+
+				gpio1: gpio-ctrl@0420 {
+					compatible = "marvell,orion-gpio";
+					#gpio-cells = <2>;
+					gpio-controller;
+					reg = <0x0420 0x20>;
+					ngpios = <32>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					interrupt-parent = <&intc>;
+					interrupts = <61>;
+				};
+
+				rtc: real-time-clock@8500 {
+					compatible = "marvell,orion-rtc";
+					reg = <0x8500 0x20>;
+				};
 			};
 
 			gconf: global-config@e802c {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
