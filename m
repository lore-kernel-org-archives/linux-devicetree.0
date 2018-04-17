Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Subject: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
Date: Tue, 17 Apr 2018 12:10:08 +0300
Message-ID: <1523956215-28154-7-git-send-email-t-kristo@ti.com>
In-Reply-To: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com
Cc: wmills@ti.com, tony@atomide.com, trini@konsulko.com, rmk@armlinux.org.uk
List-ID: <devicetree@vger.kernel.org>

The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
a display extension macro, and a few extra peripherals. Two versions
of the evm are supported, the base evm and the latest rev A3 evm. A
common overlay file is used for both boards.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
 arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
 3 files changed, 197 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-common.dtso
 create mode 100644 arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
 create mode 100644 arch/arm/boot/dts/ti/am57xx-evm.dtso

diff --git a/arch/arm/boot/dts/ti/am57xx-evm-common.dtso b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
new file mode 100644
index 0000000..68c3937
--- /dev/null
+++ b/arch/arm/boot/dts/ti/am57xx-evm-common.dtso
@@ -0,0 +1,175 @@
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+  fragment@101 {
+	target-path = "/";
+
+	__overlay__ {
+		compatible = "ti,am5728-evm", "ti,am572x-beagle-x15", "ti,am5728", "ti,dra742", "ti,dra74", "ti,dra7";
+		model = "TI AM5728 EVM";
+
+		aliases {
+			display0 = "/display";
+			display1 = "/connector";
+		};
+
+		gpio_keys {
+			compatible = "gpio-keys";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			autorepeat;
+
+			USER1 {
+				gpios = <&gpio2 23 GPIO_ACTIVE_LOW>;
+				label = "Up";
+				linux,code = <KEY_UP>;
+			};
+
+			USER2 {
+				gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
+				label = "Down";
+				linux,code = <KEY_DOWN>;
+			};
+
+			USER3 {
+				gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
+				label = "Left";
+				linux,code = <KEY_LEFT>;
+			};
+
+			USER4 {
+				gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+				label = "Right";
+				linux,code = <KEY_RIGHT>;
+			};
+
+			USER5 {
+				gpios = <&gpio2 20 GPIO_ACTIVE_LOW>;
+				label = "Home";
+				linux,code = <KEY_HOME>;
+			};
+		};
+
+		lcd0: display {
+			compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
+			backlight = <&lcd_bl>;
+			enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+			label = "lcd";
+
+			panel-timing {
+				clock-frequency = <33000000>;
+				de-active = <1>;
+				hactive = <800>;
+				hback-porch = <16>;
+				hfront-porch = <210>;
+				hsync-active = <0>;
+				hsync-len = <30>;
+				pixelclk-active = <1>;
+				vactive = <480>;
+				vback-porch = <10>;
+				vfront-porch = <22>;
+				vsync-active = <0>;
+				vsync-len = <13>;
+			};
+
+			port {
+				lcd_in: endpoint {
+					remote-endpoint = <&dpi_out>;
+				};
+			};
+		};
+
+		lcd_bl: backlight {
+			compatible = "pwm-backlight";
+			brightness-levels = <0 243 245 247 249 251 252 253 255>;
+			default-brightness-level = <8>;
+			pwms = <&ehrpwm1 0 50000 0>;
+		};
+
+		com_3v6: fixedregulator-com_3v6 {
+			compatible = "regulator-fixed";
+			regulator-name = "com_3v6";
+			regulator-min-microvolt = <3600000>;
+			regulator-max-microvolt = <3600000>;
+			vin-supply = <&evm_5v0>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vmmcwl_fixed: fixedregulator-mmcwl {
+			compatible = "regulator-fixed";
+			regulator-name = "vmmcwl_fixed";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			gpio = <&gpio5 8 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+		};
+	};
+  };
+};
+
+&ehrpwm1 {
+	status = "okay";
+};
+
+&epwmss1 {
+	status = "okay";
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pixcir_ts@5c {
+		compatible = "pixcir,pixcir_tangoc";
+		attb-gpio = <&gpio2 4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <4 0>;
+		reg = <0x5c>;
+		reset-gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+	};
+};
+
+&uart8 {
+	status = "okay";
+};
+
+&dss {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port {
+			reg = <0>;
+
+			dpi_out: endpoint {
+				data-lines = <24>;
+				remote-endpoint = <&lcd_in>;
+			};
+		};
+	};
+};
+
+&mmc3 {
+	status = "okay";
+	vmmc-supply = <&com_3v6>;
+	vqmmc-supply = <&vmmcwl_fixed>;
+	bus-width = <4>;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	non-removable;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1835";
+		reg = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+	};
+};
diff --git a/arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso b/arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
new file mode 100644
index 0000000..17e778f
--- /dev/null
+++ b/arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso
@@ -0,0 +1,11 @@
+/dts-v1/;
+/plugin/;
+
+&mmc3 {
+	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
+	pinctrl-0 = <&mmc3_pins_default>;
+	pinctrl-1 = <&mmc3_pins_hs>;
+	pinctrl-2 = <&mmc3_pins_sdr12>;
+	pinctrl-3 = <&mmc3_pins_sdr25>;
+	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev20_conf>;
+};
diff --git a/arch/arm/boot/dts/ti/am57xx-evm.dtso b/arch/arm/boot/dts/ti/am57xx-evm.dtso
new file mode 100644
index 0000000..91a57e9
--- /dev/null
+++ b/arch/arm/boot/dts/ti/am57xx-evm.dtso
@@ -0,0 +1,11 @@
+/dts-v1/;
+/plugin/;
+
+&mmc3 {
+	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50";
+	pinctrl-0 = <&mmc3_pins_default>;
+	pinctrl-1 = <&mmc3_pins_hs>;
+	pinctrl-2 = <&mmc3_pins_sdr12>;
+	pinctrl-3 = <&mmc3_pins_sdr25>;
+	pinctrl-4 = <&mmc3_pins_sdr50 &mmc3_iodelay_manual1_rev11_conf>;
+};
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
