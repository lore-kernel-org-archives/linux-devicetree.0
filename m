From: Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>
Subject: [PATCH v2] ARM: dts: kirkwood: Add DTS for Linksys EA4200v2/EA4500
Date: Mon,  4 Apr 2016 13:47:12 +0200
Message-ID: <1459770433-2876-1-git-send-email-bert@biot.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Marvell
	Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This platform is based on a Marvell 88E6282 SoC and 88E6171 switch.
---
 arch/arm/boot/dts/kirkwood-viper.dts | 236 +++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/kirkwood-viper.dts

diff --git a/arch/arm/boot/dts/kirkwood-viper.dts b/arch/arm/boot/dts/kirkwood-viper.dts
new file mode 100644
index 0000000..3ada18d
--- /dev/null
+++ b/arch/arm/boot/dts/kirkwood-viper.dts
@@ -0,0 +1,236 @@
+/*
+ * kirkwood-viper.dts - Device Tree file for Linksys viper (E4200v2 / EA4500)
+ *
+ * (c) 2013 Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
+ * (c) 2013 Deutsche Telekom Innovation Laboratories
+ * (c) 2014 Luka Perkov <luka-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
+ * (c) 2014 Randy C. Will <randall.will-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+#include "kirkwood.dtsi"
+#include "kirkwood-6282.dtsi"
+
+/ {
+	model = "Linksys Viper (E4200v2 / EA4500)";
+	compatible = "linksys,viper", "marvell,kirkwood-88f6282", "marvell,kirkwood";
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x8000000>;
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = < &pmx_btn_wps &pmx_btn_reset >;
+		pinctrl-names = "default";
+
+		wps {
+			label = "WPS Button";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+		};
+
+		reset {
+			label = "Reset Button";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = < &pmx_led_white_health &pmx_led_white_pulse >;
+		pinctrl-names = "default";
+
+		white-health {
+			label = "viper:white:health";
+			gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		white-pulse {
+			label = "viper:white:pulse";
+			gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	dsa {
+		compatible = "marvell,dsa";
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		dsa,ethernet = <&eth0port>;
+		dsa,mii-bus = <&mdio>;
+
+		switch@16,0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <16 0>;	/* MDIO address 16, switch 0 in tree */
+
+			port@0 {
+				reg = <0>;
+				label = "ethernet1";
+			};
+
+			port@1 {
+				reg = <1>;
+				label = "ethernet2";
+			};
+
+			port@2 {
+				reg = <2>;
+				label = "ethernet3";
+			};
+
+			port@3 {
+				reg = <3>;
+				label = "ethernet4";
+			};
+
+			port@4 {
+				reg = <4>;
+				label = "internet";
+			};
+
+			port@5 {
+				reg = <5>;
+				label = "cpu";
+			};
+		};
+	};
+};
+
+&pinctrl {
+	pmx_led_white_health: pmx-led-white-health {
+		marvell,pins = "mpp7";
+		marvell,function = "gpo";
+	};
+	pmx_led_white_pulse: pmx-led-white-pulse {
+		marvell,pins = "mpp14";
+		marvell,function = "gpio";
+	};
+	pmx_btn_wps: pmx-btn-wps {
+		marvell,pins = "mpp47";
+		marvell,function = "gpio";
+	};
+	pmx_btn_reset: pmx-btn-reset {
+		marvell,pins = "mpp48";
+		marvell,function = "gpio";
+	};
+};
+
+&nand {
+	status = "okay";
+	pinctrl-0 = <&pmx_nand>;
+	pinctrl-names = "default";
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x80000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "u_env";
+			reg = <0x80000 0x20000>;
+		};
+
+		partition@A0000 {
+			label = "s_env";
+			reg = <0xA0000 0x20000>;
+		};
+
+		partition@200000 {
+			label = "kernel";
+			reg = <0x200000 0x2A0000>;
+		};
+
+		partition@4A0000 {
+			label = "rootfs";
+			reg = <0x4A0000 0x1760000>;
+		};
+
+		partition@1C00000 {
+			label = "alt_kernel";
+			reg = <0x1C00000 0x2A0000>;
+		};
+
+		partition@1EA0000 {
+			label = "alt_rootfs";
+			reg = <0x1EA0000 0x1760000>;
+		};
+
+		partition@3600000 {
+			label = "syscfg";
+			reg = <0x3600000 0x4A00000>;
+		};
+
+		partition@C0000 {
+			label = "unused";
+			reg = <0xC0000 0x140000>;
+		};
+
+	};
+};
+
+&pciec {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+/* eth0 is connected to a Marvell 88E6171 switch, without a PHY. So set
+ * fixed speed and duplex. */
+&eth0 {
+	status = "okay";
+	ethernet0-port@0 {
+		speed = <1000>;
+		duplex = <1>;
+	};
+};
+
+/* eth1 doesn't appear to be connected at all. */
+&eth1 {
+	status = "disabled";
+};
+
+/* There is no battery on the board, so the RTC does not keep
+   time when there is no power, making it useless. */
+&rtc {
+	status = "disabled";
+};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
