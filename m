Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 08/13] ARM: dts: ti: add dra71-evm overlays
Date: Tue, 17 Apr 2018 12:10:10 +0300
Message-ID: <1523956215-28154-9-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

Add dra71-evm overlay files. There are two overlays available, the gpmc
and the display ones. These are mutually exclusive, as they share certain
hardware resources.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 .../boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtso | 121 +++++++++++++++++++++
 arch/arm/boot/dts/ti/dra71-evm-nand.dtso           |   6 +
 2 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtso
 create mode 100644 arch/arm/boot/dts/ti/dra71-evm-nand.dtso

diff --git a/arch/arm/boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtso b/arch/arm/boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtso
new file mode 100644
index 0000000..bebfe43
--- /dev/null
+++ b/arch/arm/boot/dts/ti/dra71-evm-lcd-auo-g101evn01.0.dtso
@@ -0,0 +1,121 @@
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+  fragment@101 {
+	target-path = "/";
+
+	__overlay__ {
+		model = "TI DRA71 EVM-LCD-AUO-Display";
+
+		aliases {
+			display0 = "/display";
+			display1 = "/connector";
+		};
+
+		backlight {
+			compatible = "led-backlight";
+			brightness-levels = <0 2 38 74 110 146 182 218 255>;
+			default-brightness-level = <8>;
+			enable-gpios = <&pcf_display_board 0 GPIO_ACTIVE_LOW>;
+			leds = <&backlight_led>;
+		};
+
+		lcd: display {
+			compatible = "auo,g101evn01.0", "panel-dpi";
+			enable-gpios = <&pcf_lcd 13 GPIO_ACTIVE_LOW>;
+			label = "lcd";
+
+			panel-timing {
+				clock-frequency = <68930000>;
+				de-active = <1>;
+				hactive = <1280>;
+				hback-porch = <48>;
+				hfront-porch = <48>;
+				hsync-active = <0>;
+				hsync-len = <32>;
+				pixelclk-active = <1>;
+				vactive = <800>;
+				vback-porch = <8>;
+				vfront-porch = <4>;
+				vsync-active = <0>;
+				vsync-len = <4>;
+			};
+
+			port {
+				lcd_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+		};
+	};
+  };
+};
+
+&pcf_gpio_21 {
+	p0 {
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
+		line-name = "sel_gpmc_ad_vid_s0";
+		output-low;
+	};
+
+	p7 {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_HIGH>;
+		line-name = "sel_gpmc_ad_vid_s2";
+		output-high;
+	};
+};
+
+&i2c1 {
+	pcf_display_board: gpio@27 {
+		compatible = "nxp,pcf8575";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x27>;
+	};
+
+	tlc59108@40 {
+		compatible = "ti,tlc59108";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x40>;
+
+		backlight_led: bl@2 {
+			label = "backlight";
+			reg = <0x2>;
+		};
+	};
+
+	touchscreen: goodix-gt9271@14 {
+		compatible = "goodix,gt9271";
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
+		irq-gpios = <&pcf_display_board 6 GPIO_ACTIVE_HIGH>;
+		reg = <0x14>;
+		reset-gpios = <&pcf_display_board 5 GPIO_ACTIVE_LOW>;
+		status = "okay";
+		touchscreen-inverted-y;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+	};
+};
+
+&dss {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dss_port: port {
+			reg = <2>;
+
+			dpi_out: endpoint {
+				data-lines = <24>;
+				remote-endpoint = <&lcd_in>;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/ti/dra71-evm-nand.dtso b/arch/arm/boot/dts/ti/dra71-evm-nand.dtso
new file mode 100644
index 0000000..280b0ba
--- /dev/null
+++ b/arch/arm/boot/dts/ti/dra71-evm-nand.dtso
@@ -0,0 +1,6 @@
+/dts-v1/;
+/plugin/;
+
+&gpmc {
+	status = "okay";
+};
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
