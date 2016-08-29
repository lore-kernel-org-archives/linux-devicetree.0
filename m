From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 3/3] ARM64: dts: amlogic: Switch Meson GXBB dtsi to use common GX dtsi
Date: Mon, 29 Aug 2016 09:56:11 +0200
Message-ID: <1472457371-1305-4-git-send-email-narmstrong@baylibre.com>
References: <1472457371-1305-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472457371-1305-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Amlogic Meson GXBB should use the common GX dtsi as base.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 320 +++++++++-------------------
 1 file changed, 99 insertions(+), 221 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 2ea7bbd..e1e22fd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -40,9 +40,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/interrupt-controller/irq.h>
-#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "meson-gx-common.dtsi"
 #include <dt-bindings/gpio/meson-gxbb-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/clock/gxbb-clkc.h>
@@ -51,185 +49,8 @@
 
 / {
 	compatible = "amlogic,meson-gxbb";
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	cpus {
-		#address-cells = <0x2>;
-		#size-cells = <0x0>;
-
-		cpu0: cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53", "arm,armv8";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-		};
-
-		cpu1: cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53", "arm,armv8";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-		};
-
-		cpu2: cpu@2 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53", "arm,armv8";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-		};
-
-		cpu3: cpu@3 {
-			device_type = "cpu";
-			compatible = "arm,cortex-a53", "arm,armv8";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-		};
-	};
-
-	arm-pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
-	};
-
-	psci {
-		compatible = "arm,psci-0.2";
-		method = "smc";
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 13
-			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
-			     <GIC_PPI 14
-			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
-			     <GIC_PPI 11
-			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
-			     <GIC_PPI 10
-			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>;
-	};
-
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
 
 	soc {
-		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		cbus: cbus@c1100000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xc1100000 0x0 0x100000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
-
-			reset: reset-controller@4404 {
-				compatible = "amlogic,meson-gxbb-reset";
-				reg = <0x0 0x04404 0x0 0x20>;
-				#reset-cells = <1>;
-			};
-
-			uart_A: serial@84c0 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x84c0 0x0 0x14>;
-				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
-				status = "disabled";
-			};
-
-			uart_B: serial@84dc {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x84dc 0x0 0x14>;
-				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
-				status = "disabled";
-			};
-
-			uart_C: serial@8700 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x8700 0x0 0x14>;
-				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
-				status = "disabled";
-			};
-
-			watchdog@98d0 {
-				compatible = "amlogic,meson-gxbb-wdt";
-				reg = <0x0 0x098d0 0x0 0x10>;
-				clocks = <&xtal>;
-			};
-		};
-
-		gic: interrupt-controller@c4301000 {
-			compatible = "arm,gic-400";
-			reg = <0x0 0xc4301000 0 0x1000>,
-			      <0x0 0xc4302000 0 0x2000>,
-			      <0x0 0xc4304000 0 0x2000>,
-			      <0x0 0xc4306000 0 0x2000>;
-			interrupt-controller;
-			interrupts = <GIC_PPI 9
-				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
-			#interrupt-cells = <3>;
-			#address-cells = <0>;
-		};
-
-		aobus: aobus@c8100000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xc8100000 0x0 0x100000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
-
-			pinctrl_aobus: pinctrl@14 {
-				compatible = "amlogic,meson-gxbb-aobus-pinctrl";
-				#address-cells = <2>;
-				#size-cells = <2>;
-				ranges;
-
-				gpio_ao: bank@14 {
-					reg = <0x0 0x00014 0x0 0x8>,
-					      <0x0 0x0002c 0x0 0x4>,
-					      <0x0 0x00024 0x0 0x8>;
-					reg-names = "mux", "pull", "gpio";
-					gpio-controller;
-					#gpio-cells = <2>;
-				};
-
-				uart_ao_a_pins: uart_ao_a {
-					mux {
-						groups = "uart_tx_ao_a", "uart_rx_ao_a";
-						function = "uart_ao";
-					};
-				};
-			};
-
-			clkc_AO: clock-controller@040 {
-				compatible = "amlogic,gxbb-aoclkc";
-				reg = <0x0 0x00040 0x0 0x4>;
-				#clock-cells = <1>;
-				#reset-cells = <1>;
-			};
-
-			uart_AO: serial@4c0 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x004c0 0x0 0x14>;
-				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
-				status = "disabled";
-			};
-		};
-
 		periphs: periphs@c8834000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8834000 0x0 0x2000>;
@@ -340,47 +161,6 @@
 			};
 		};
 
-		apb: apb@d0000000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xd0000000 0x0 0x200000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
-
-			sd_emmc_a: mmc@70000 {
-				compatible = "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x70000 0x0 0x2000>;
-				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clkc CLKID_SD_EMMC_A>,
-					 <&xtal>,
-					 <&clkc CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
-				status = "disabled";
-			};
-
-			sd_emmc_b: mmc@72000 {
-				compatible = "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x72000 0x0 0x2000>;
-				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clkc CLKID_SD_EMMC_B>,
-					 <&xtal>,
-					 <&clkc CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
-				status = "disabled";
-			};
-
-			sd_emmc_c: mmc@74000 {
-				compatible = "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x74000 0x0 0x2000>;
-				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&clkc CLKID_SD_EMMC_C>,
-					 <&xtal>,
-					 <&clkc CLKID_FCLK_DIV2>;
-				clock-names = "core", "clkin0", "clkin1";
-				status = "disabled";
-			};
-		};
-
 		ethmac: ethernet@c9410000 {
 			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
@@ -394,3 +174,101 @@
 		};
 	};
 };
+
+&cbus {
+	reset: reset-controller@4404 {
+		compatible = "amlogic,meson-gxbb-reset";
+		reg = <0x0 0x04404 0x0 0x20>;
+		#reset-cells = <1>;
+	};
+
+	uart_B: serial@84dc {
+		compatible = "amlogic,meson-uart";
+		reg = <0x0 0x84dc 0x0 0x14>;
+		interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xtal>;
+		status = "disabled";
+	};
+
+	uart_C: serial@8700 {
+		compatible = "amlogic,meson-uart";
+		reg = <0x0 0x8700 0x0 0x14>;
+		interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&xtal>;
+		status = "disabled";
+	};
+
+	watchdog@98d0 {
+		compatible = "amlogic,meson-gxbb-wdt";
+		reg = <0x0 0x098d0 0x0 0x10>;
+		clocks = <&xtal>;
+	};
+};
+
+&aobus {
+	pinctrl_aobus: pinctrl@14 {
+		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio_ao: bank@14 {
+			reg = <0x0 0x00014 0x0 0x8>,
+			      <0x0 0x0002c 0x0 0x4>,
+			      <0x0 0x00024 0x0 0x8>;
+			reg-names = "mux", "pull", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		uart_ao_a_pins: uart_ao_a {
+			mux {
+				groups = "uart_tx_ao_a", "uart_rx_ao_a";
+				function = "uart_ao";
+			};
+		};
+	};
+
+	clkc_AO: clock-controller@040 {
+		compatible = "amlogic,gxbb-aoclkc";
+		reg = <0x0 0x00040 0x0 0x4>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+};
+
+&apb {
+	sd_emmc_a: mmc@70000 {
+		compatible = "amlogic,meson-gxbb-mmc";
+		reg = <0x0 0x70000 0x0 0x2000>;
+		interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkc CLKID_SD_EMMC_A>,
+			 <&xtal>,
+			 <&clkc CLKID_FCLK_DIV2>;
+		clock-names = "core", "clkin0", "clkin1";
+		status = "disabled";
+	};
+
+	sd_emmc_b: mmc@72000 {
+		compatible = "amlogic,meson-gxbb-mmc";
+		reg = <0x0 0x72000 0x0 0x2000>;
+		interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkc CLKID_SD_EMMC_B>,
+			 <&xtal>,
+			 <&clkc CLKID_FCLK_DIV2>;
+		clock-names = "core", "clkin0", "clkin1";
+		status = "disabled";
+	};
+
+	sd_emmc_c: mmc@74000 {
+		compatible = "amlogic,meson-gxbb-mmc";
+		reg = <0x0 0x74000 0x0 0x2000>;
+		interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&clkc CLKID_SD_EMMC_C>,
+			 <&xtal>,
+			 <&clkc CLKID_FCLK_DIV2>;
+		clock-names = "core", "clkin0", "clkin1";
+		status = "disabled";
+	};
+};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
