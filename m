From: megous via linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: [PATCH v2 02/13] arm64: dts: allwinner: h6: Add Orange
 Pi 3 DTS
Date: Tue,  9 Apr 2019 02:24:41 +0200
Message-ID: <20190409002452.14551-3-megous@megous.com>
References: <20190409002452.14551-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBW6MV7SQKGQEQNKLT3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20190409002452.14551-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm802
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

Orange Pi 3 is a H6 based SBC made by Xulong, released in January 2019. It
has the following features:

- Allwinner H6 quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 1GB or 2GB LPDDR3 RAM
- AXP805 PMIC
- AP6256 Wifi/BT 5.0
- USB 2.0 host port (A)
- USB 2.0 micro usb, OTG
- USB 3.0 Host + 4 port USB hub (GL3510)
- Gigabit Ethernet (Realtek RTL8211E phy)
- HDMI 2.0 port
- soldered eMMC (optional)
- 3x LED (one is on the bottom)
- microphone
- audio jack
- PCIe

Add basic support for the board.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 216 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/a=
llwinner/Makefile
index e4dce2f6fa3a..285a7cb5135b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
+dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/=
arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
new file mode 100644
index 000000000000..5fbc5e410883
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2019 Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
+ */
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model =3D "OrangePi 3";
+	compatible =3D "xunlong,orangepi-3", "allwinner,sun50i-h6";
+
+	aliases {
+		serial0 =3D &uart0;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		power {
+			label =3D "orangepi:red:power";
+			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+			default-state =3D "on";
+		};
+
+		status {
+			label =3D "orangepi:green:status";
+			gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+		};
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC jack */
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc-5v";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply =3D <&reg_dcdca>;
+};
+
+&ehci0 {
+	status =3D "okay";
+};
+
+&ehci3 {
+	status =3D "okay";
+};
+
+&mmc0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&mmc0_pins>;
+	vmmc-supply =3D <&reg_cldo1>;
+	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	bus-width =3D <4>;
+	status =3D "okay";
+};
+
+&ohci0 {
+	status =3D "okay";
+};
+
+&ohci3 {
+	status =3D "okay";
+};
+
+&pio {
+	vcc-pc-supply =3D <&reg_bldo2>;
+	vcc-pd-supply =3D <&reg_cldo1>;
+};
+
+&r_i2c {
+	status =3D "okay";
+
+	axp805: pmic@36 {
+		compatible =3D "x-powers,axp805", "x-powers,axp806";
+		reg =3D <0x36>;
+		interrupt-parent =3D <&r_intc>;
+		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+		x-powers,self-working-mode;
+		vina-supply =3D <&reg_vcc5v>;
+		vinb-supply =3D <&reg_vcc5v>;
+		vinc-supply =3D <&reg_vcc5v>;
+		vind-supply =3D <&reg_vcc5v>;
+		vine-supply =3D <&reg_vcc5v>;
+		aldoin-supply =3D <&reg_vcc5v>;
+		bldoin-supply =3D <&reg_vcc5v>;
+		cldoin-supply =3D <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc-pl-led-ir";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc33-audio-tv-ephy-mac";
+			};
+
+			/* ALDO3 is shorted to CLDO1 */
+			reg_aldo3: aldo3 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-1";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc18-dram-bias-pll";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc-efuse-pcie-hdmi-pc";
+			};
+
+			bldo3 {
+				/* unused */
+			};
+
+			bldo4 {
+				/* unused */
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc33-io-pd-emmc-sd-usb-uart-2";
+			};
+
+			cldo2 {
+				/* unused */
+			};
+
+			cldo3 {
+				/* unused */
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt =3D <800000>;
+				regulator-max-microvolt =3D <1160000>;
+				regulator-name =3D "vdd-cpu";
+			};
+
+			reg_dcdcc: dcdcc {
+				regulator-min-microvolt =3D <810000>;
+				regulator-max-microvolt =3D <1080000>;
+				regulator-name =3D "vdd-gpu";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt =3D <960000>;
+				regulator-max-microvolt =3D <960000>;
+				regulator-name =3D "vdd-sys";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <1200000>;
+				regulator-name =3D "vcc-dram";
+			};
+
+			sw {
+				/* unused */
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart0_ph_pins>;
+	status =3D "okay";
+};
+
+&usb2otg {
+	/*
+	 * Beware that this board will not automatically disconnect
+	 * VBUS from DCIN, when self-powered and used as a peripheral.
+	 */
+	dr_mode =3D "otg";
+	status =3D "okay";
+};
+
+&usb2phy {
+	usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
+	usb0_vbus-supply =3D <&reg_vcc5v>;
+	usb3_vbus-supply =3D <&reg_vcc5v>;
+	status =3D "okay";
+};
--=20
2.21.0

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
