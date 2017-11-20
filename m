From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [RESEND PATCH v3 2/2] ARM64: dts: meson-axg: add pinctrl DT info for Meson-AXG SoC
Date: Mon, 20 Nov 2017 18:23:54 +0800
Message-ID: <20171120102354.5354-3-yixun.lan@amlogic.com>
References: <20171120102354.5354-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171120102354.5354-1-yixun.lan@amlogic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

Add new pinctrl DT info for the Amlogic's Meson-AXG SoC.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5fc33b76b91c..e0fb860e12c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/axg-clkc.h>
 #include <dt-bindings/clock/axg-aoclkc.h>
+#include <dt-bindings/gpio/meson-axg-gpio.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -173,6 +174,32 @@
 			#mbox-cells = <1>;
 		};
 
+		periphs: periphs@ff634000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff634000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
+
+			pinctrl_periphs: pinctrl@480 {
+				compatible = "amlogic,meson-axg-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank@480 {
+					reg = <0x0 0x00480 0x0 0x40>,
+						<0x0 0x004e8 0x0 0x14>,
+						<0x0 0x00520 0x0 0x14>,
+						<0x0 0x00430 0x0 0x3c>;
+					reg-names = "mux", "pull", "pull-enable", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&pinctrl_periphs 0 0 86>;
+				};
+			};
+		};
+
 		sram: sram@fffc0000 {
 			compatible = "amlogic,meson-axg-sram", "mmio-sram";
 			reg = <0x0 0xfffc0000 0x0 0x20000>;
@@ -209,6 +236,23 @@
 				};
 			};
 
+			pinctrl_aobus: pinctrl@14 {
+				compatible = "amlogic,meson-axg-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank@14 {
+					reg = <0x0 0x00014 0x0 0x8>,
+						<0x0 0x0002c 0x0 0x4>,
+						<0x0 0x00024 0x0 0x8>;
+					reg-names = "mux", "pull", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&pinctrl_aobus 0 0 15>;
+				};
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
-- 
2.15.0

