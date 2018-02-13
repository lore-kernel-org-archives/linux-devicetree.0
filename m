From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 00:29:48 +0100
Message-ID: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stout base board support making use of 1 GiB of memory,
the Renesas H2 r8a7790 SoC with the SCIFA0 serial port
and CA15 with ARM architected timer.

Furthermore, this device tree contains entries for:
  - 4x LEDs
  - SDHI SD/MMC controller
  - Display unit with HDMI output
  - SH fast ethernet controller
  - QSPI controller with S25FL512S attached to it
  - I2C controller with DA9210 and DA 9063 PMICs

Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/r8a7790-stout.dts | 360 ++++++++++++++++++++++++++++++++++++
 2 files changed, 361 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7790-stout.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f7b73c825231..6d1999467f2e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -790,6 +790,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7778-bockw.dtb \
 	r8a7779-marzen.dtb \
 	r8a7790-lager.dtb \
+	r8a7790-stout.dtb \
 	r8a7791-koelsch.dtb \
 	r8a7791-porter.dtb \
 	r8a7792-blanche.dtb \
diff --git a/arch/arm/boot/dts/r8a7790-stout.dts b/arch/arm/boot/dts/r8a7790-stout.dts
new file mode 100644
index 000000000000..9bc892eacc97
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7790-stout.dts
@@ -0,0 +1,360 @@
+/*
+ * Device Tree Source for the Stout board
+ *
+ * Copyright (C) 2018 Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "r8a7790.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Stout";
+	compatible = "renesas,stout", "renesas,r8a7790";
+
+	aliases {
+		serial0 = &scifa0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		stdout-path = "serial0:38400n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		};
+		led2 {
+			gpios = <&gpio4 23 GPIO_ACTIVE_HIGH>;
+		};
+		led3 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		};
+		led5 {
+			gpios = <&gpio4 24 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	fixedregulator3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7511_out>;
+			};
+		};
+	};
+
+	x2_clk: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+
+	x13_clk: x13-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <148500000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>, <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 726>, <&cpg CPG_MOD 725>,
+		 <&x13_clk>, <&x2_clk>;
+	clock-names = "du.0", "du.1", "du.2", "lvds.0", "lvds.1",
+		      "dclkin.0", "dclkin.1";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7511_in>;
+			};
+		};
+		port@1 {
+			lvds_connector0: endpoint {
+			};
+		};
+		port@2 {
+			lvds_connector1: endpoint {
+			};
+		};
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
+
+&pfc {
+
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
+	du_pins: du {
+		groups = "du_rgb888", "du_sync_1", "du_clk_out_0";
+		function = "du";
+	};
+
+	scifa0_pins: scifa0 {
+		groups = "scifa0_data_b";
+		function = "scifa0";
+	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk";
+		function = "scif_clk";
+	};
+
+	ether_pins: ether {
+		groups = "eth_link", "eth_mdio", "eth_rmii";
+		function = "eth";
+	};
+
+	phy1_pins: phy1 {
+		groups = "intc_irq1";
+		function = "intc";
+	};
+
+	sdhi0_pins: sd0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+		power-source = <3300>;
+	};
+
+	qspi_pins: qspi {
+		groups = "qspi_ctrl", "qspi_data4";
+		function = "qspi";
+	};
+
+	iic2_pins: iic2 {
+		groups = "iic2_b";
+		function = "iic2";
+	};
+
+	iic3_pins: iic3 {
+		groups = "iic3";
+		function = "iic3";
+	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+};
+
+&ether {
+	pinctrl-0 = <&ether_pins &phy1_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&phy1>;
+	renesas,ether-link-active-low;
+	status = "okay";
+
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+		micrel,led-mode = <1>;
+	};
+};
+
+&cmt0 {
+	status = "okay";
+};
+
+&qspi {
+	pinctrl-0 = <&qspi_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "spansion,s25fl512s", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		spi-cpha;
+		spi-cpol;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "loader";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "user";
+				reg = <0x00040000 0x00400000>;
+				read-only;
+			};
+			partition@440000 {
+				label = "flash";
+				reg = <0x00440000 0x03bc0000>;
+			};
+		};
+	};
+};
+
+&scifa0 {
+	pinctrl-0 = <&scifa0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	cd-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu0-supply = <&vdd_dvfs>;
+};
+
+&iic2	{
+	status = "okay";
+	pinctrl-0 = <&iic2_pins>;
+	pinctrl-names = "default";
+
+	clock-frequency = <100000>;
+
+	hdmi@39 {
+		compatible = "adi,adv7511w";
+		reg = <0x39>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7511_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7511_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
+&iic3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&iic3_pins>;
+	status = "okay";
+
+	pmic@58 {
+		compatible = "dlg,da9063";
+		reg = <0x58>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+
+		rtc {
+			compatible = "dlg,da9063-rtc";
+		};
+
+		wdt {
+			compatible = "dlg,da9063-watchdog";
+		};
+	};
+
+	vdd_dvfs: regulator@68 {
+		compatible = "dlg,da9210";
+		reg = <0x68>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd: regulator@70 {
+		compatible = "dlg,da9210";
+		reg = <0x70>;
+		interrupt-parent = <&irqc0>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&pci0 {
+	status = "okay";
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
