From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv0] ARM: kirkwood: Add support for NETGEAR ReadyNAS NV+ v2
Date: Sat, 30 Nov 2013 16:13:44 +0100
Message-ID: <58e99356aad0daf90d28162eac6a4ecec70470f8.1385822676.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Almost all hardware parts of the NETGEAR ReadyNAS NV+ v2 ([1] for more
details) are supported by mainline kernel. The only missing elements in
provided .dts file are:

 - the front LCD module (Winstar WINSTAR WH1602): driver development is
   ongoing. This is the same LCD module as on ReadyNAS 104.
 - the Macronix MX25L512 512Kbit SPI flash: no time to play with it yet=
=2E

The device is the big brother (4 vs 2 bay) of the ReadyNAS Duo v2. The
main differences are some additional LEDs for the disks, a Marvell
88SM4140 SATA Port multiplier (no driver required to access the disk)
and previously described LCD module. Otherwise, it shares the same SoC
(kirkwood 88F6282), RAM (256MB), NAND (128MB), RTC chip (Ricoh rs5c372a=
),
fan controller (GMT G762), XHCI controller (NEC/Renesas =C2=B5PD720200)=
=2E

[1]: http://natisbad.org/NAS5/

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
Hi,

This is v3.14 material. As most of the .dts file content can be shared
w/ Duo v2 one, I intend to work on that aspect for next round (it was
easier for me to develop and test on a flat .dts).

To be more specific, the main differences between the two files are
different GPIO values for gpio-leds nodes and pinctrl, and 2 additional
LEDs.

If you have comments or directions to avoid common mistakes while doing
that work, I'll take them into account. Meanwhile, I will start and tak=
e
a look at existing .dtsi files.

Cheers,

a+

 arch/arm/boot/dts/Makefile                         |   1 +
 .../boot/dts/kirkwood-netgear_readynas_nv+_v2.dts  | 270 +++++++++++++=
++++++++
 2 files changed, 271 insertions(+)
 create mode 100644 arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.=
dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d57c1a6..c9cd0e9 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_KIRKWOOD) +=3D kirkwood-cloudbox.dt=
b \
 	kirkwood-mplcec4.dtb \
 	kirkwood-mv88f6281gtw-ge.dtb \
 	kirkwood-netgear_readynas_duo_v2.dtb \
+	kirkwood-netgear_readynas_nv+_v2.dtb \
 	kirkwood-ns2.dtb \
 	kirkwood-ns2lite.dtb \
 	kirkwood-ns2max.dtb \
diff --git a/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts b/a=
rch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts
new file mode 100644
index 0000000..9cb5d26
--- /dev/null
+++ b/arch/arm/boot/dts/kirkwood-netgear_readynas_nv+_v2.dts
@@ -0,0 +1,270 @@
+/*
+ * Device Tree file for NETGEAR ReadyNAS NV+ v2
+ *
+ * Copyright (C) 2013, Arnaud EBALARD <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "kirkwood.dtsi"
+#include "kirkwood-6282.dtsi"
+
+/ {
+	model =3D "NETGEAR ReadyNAS NV+ v2";
+	compatible =3D "netgear,readynas-nv+-v2", "netgear,readynas", "marvel=
l,kirkwood-88f6282", "marvell,kirkwood";
+
+	memory { /* 256 MB */
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x10000000>;
+	};
+
+	chosen {
+		bootargs =3D "console=3DttyS0,115200n8 earlyprintk";
+	};
+
+	mbus {
+		pcie-controller {
+			status =3D "okay";
+
+			/* Connected to NEC uPD720200 USB 3.0 controller */
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status =3D "okay";
+			};
+		};
+	};
+
+	ocp@f1000000 {
+		pinctrl: pinctrl@10000 {
+			pmx_button_power: pmx-button-power {
+				marvell,pins =3D "mpp47";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_button_backup: pmx-button-backup {
+				marvell,pins =3D "mpp45";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_button_reset: pmx-button-reset {
+				marvell,pins =3D "mpp13";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_power: pmx-led-blue-power {
+				marvell,pins =3D "mpp31";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_backup: pmx-led-blue-backup {
+				marvell,pins =3D "mpp22";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_disk1: pmx-led-blue-disk1 {
+				marvell,pins =3D "mpp20";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_disk2: pmx-led-blue-disk2 {
+				marvell,pins =3D "mpp23";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_disk3: pmx-led-blue-disk3 {
+				marvell,pins =3D "mpp24";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_led_blue_disk4: pmx-led-blue-disk4 {
+				marvell,pins =3D "mpp29";
+				marvell,function =3D "gpio";
+			};
+
+			pmx_poweroff: pmx-poweroff {
+				marvell,pins =3D "mpp30";
+				marvell,function =3D "gpio";
+			};
+		};
+
+		clocks {
+		       g762_clk: g762-oscillator {
+				 compatible =3D "fixed-clock";
+				 #clock-cells =3D <0>;
+				 clock-frequency =3D <8192>;
+		       };
+		};
+
+		i2c@11000 {
+			status =3D "okay";
+
+			rs5c372a: rs5c372a@32 {
+				compatible =3D "ricoh,rs5c372a";
+				reg =3D <0x32>;
+			};
+
+			g762: g762@3e {
+				compatible =3D "gmt,g762";
+				reg =3D <0x3e>;
+				clocks =3D <&g762_clk>; /* input clock */
+				fan_gear_mode =3D <0>;
+				fan_startv =3D <1>;
+				pwm_polarity =3D <0>;
+			};
+		};
+
+		serial@12000 {
+			pinctrl-0 =3D <&pmx_uart0>;
+			pinctrl-names =3D "default";
+			status =3D "okay";
+		};
+
+		sata@80000 { /* Connected to Marvell 88SM4140 SATA port multiplier *=
/
+			status =3D "okay";
+			nr-ports =3D <1>;
+		};
+	};
+
+	gpio-leds {
+		compatible =3D "gpio-leds";
+		pinctrl-0 =3D < &pmx_led_blue_power &pmx_led_blue_backup
+			      &pmx_led_blue_disk1 &pmx_led_blue_disk2
+			      &pmx_led_blue_disk3 &pmx_led_blue_disk3 >;
+		pinctrl-names =3D "default";
+
+		power_led {
+			label =3D "status:blue:power_led";
+			gpios =3D <&gpio0 31 GPIO_ACTIVE_LOW>;
+			linux,default-trigger =3D "default-on";
+		};
+
+		backup_led {
+			label =3D "status:blue:backup_led";
+			gpios =3D <&gpio0 22 GPIO_ACTIVE_LOW>;
+		};
+
+		disk1_led {
+			label =3D "status:blue:disk1_led";
+			gpios =3D <&gpio0 20 GPIO_ACTIVE_LOW>;
+		};
+
+		disk2_led {
+			label =3D "status:blue:disk2_led";
+			gpios =3D <&gpio0 23 GPIO_ACTIVE_LOW>;
+		};
+
+		disk3_led {
+			label =3D "status:blue:disk3_led";
+			gpios =3D <&gpio0 24 GPIO_ACTIVE_LOW>;
+		};
+
+		disk4_led {
+			label =3D "status:blue:disk4_led";
+			gpios =3D <&gpio0 29 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-0 =3D <&pmx_button_power &pmx_button_backup
+			     &pmx_button_reset>;
+		pinctrl-names =3D "default";
+
+		power-button {
+			label =3D "Power Button";
+			linux,code =3D <KEY_POWER>;
+			gpios =3D <&gpio1 15 GPIO_ACTIVE_LOW>;
+		};
+
+		reset-button {
+			label =3D "Reset Button";
+			linux,code =3D <KEY_RESTART>;
+			gpios =3D <&gpio0 13 GPIO_ACTIVE_LOW>;
+		};
+
+		backup-button {
+			label =3D "Backup Button";
+			linux,code =3D <KEY_COPY>;
+			gpios =3D <&gpio1 13 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-poweroff {
+		compatible =3D "gpio-poweroff";
+		pinctrl-0 =3D <&pmx_poweroff>;
+		pinctrl-names =3D "default";
+		gpios =3D <&gpio0 30 GPIO_ACTIVE_LOW>;
+	};
+
+	regulators {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		usb3_regulator: usb3-regulator {
+			compatible =3D "regulator-fixed";
+			reg =3D <1>;
+			regulator-name =3D "USB 3.0 Power";
+			regulator-min-microvolt =3D <5000000>;
+			regulator-max-microvolt =3D <5000000>;
+			enable-active-high;
+			regulator-always-on;
+			regulator-boot-on;
+			gpio =3D <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&nand {
+	status =3D "okay";
+
+	partition@0 {
+		label =3D "u-boot";
+		reg =3D <0x0000000 0x180000>;
+		read-only;
+	};
+
+	partition@180000 {
+		label =3D "u-boot-env";
+		reg =3D <0x180000 0x20000>;
+	};
+
+	partition@200000 {
+		label =3D "uImage";
+		reg =3D <0x0200000 0x600000>;
+	};
+
+	partition@800000 {
+		label =3D "minirootfs";
+		reg =3D <0x0800000 0x1000000>;
+	};
+
+	partition@1800000 {
+		label =3D "jffs2";
+		reg =3D <0x1800000 0x6800000>;
+	};
+};
+
+&mdio {
+	status =3D "okay";
+
+	ethphy0: ethernet-phy@0 { /* Marvell 88E1318 */
+		device_type =3D "ethernet-phy";
+		reg =3D <0>;
+	};
+};
+
+&eth0 {
+	status =3D "okay";
+
+	ethernet0-port@0 {
+		phy-handle =3D <&ethphy0>;
+	};
+};
--=20
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
