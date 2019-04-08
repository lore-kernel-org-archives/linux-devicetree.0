From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 3/6] arm64: dts: allwinner: h6: Introduce
 Beelink GS1 board
Date: Mon,  8 Apr 2019 17:27:52 +0200
Message-ID: <20190408152755.17405-4-peron.clem@gmail.com>
References: <20190408152755.17405-1-peron.clem@gmail.com>
Reply-To: peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCELXIX7UICBBNOPVXSQKGQERWDHNJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190408152755.17405-1-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Beelink GS1 is an Allwinner H6 based TV box,
which support:
- Allwinner H6 Quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 2GB LPDDR3 RAM
- AXP805 PMIC
- 1Gbps GMAC via RTL8211E
- FN-Link 6222B-SRB Wifi/BT
- 1x USB 2.0 Host and 1x USB 3.0 Host
- HDMI port
- S/PDIF Tx
- IR receiver
- 5V/2A DC power supply

Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 260 ++++++++++++++++++
 2 files changed, 261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/a=
llwinner/Makefile
index e4dce2f6fa3a..2dd806a3d5c9 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-pc2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-prime.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
+dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts b/arch=
/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
new file mode 100644
index 000000000000..0dc33c90dd60
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2019 Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ */
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model =3D "Beelink GS1";
+	compatible =3D "azw,beelink-gs1", "allwinner,sun50i-h6";
+
+	aliases {
+		ethernet0 =3D &emac;
+		serial0 =3D &uart0;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	connector {
+		compatible =3D "hdmi-connector";
+		type =3D "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint =3D <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+
+		power {
+			label =3D "beelink:white:power";
+			gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+			default-state =3D "on";
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
+&de {
+	status =3D "okay";
+};
+
+&ehci0 {
+	status =3D "okay";
+};
+
+&emac {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&ext_rgmii_pins>;
+	phy-mode =3D "rgmii";
+	phy-handle =3D <&ext_rgmii_phy>;
+	phy-supply =3D <&reg_aldo2>;
+	status =3D "okay";
+};
+
+&hdmi {
+	status =3D "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint =3D <&hdmi_con_in>;
+	};
+};
+
+&mdio {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible =3D "ethernet-phy-ieee802.3-c22";
+		reg =3D <1>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply =3D <&reg_cldo1>;
+	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
+	bus-width =3D <4>;
+	status =3D "okay";
+};
+
+&mmc2 {
+	vmmc-supply =3D <&reg_cldo1>;
+	vqmmc-supply =3D <&reg_bldo2>;
+	non-removable;
+	cap-mmc-hw-reset;
+	bus-width =3D <8>;
+	status =3D "okay";
+};
+
+&ohci0 {
+	status =3D "okay";
+};
+
+&pio {
+	vcc-pd-supply =3D <&reg_cldo1>;
+	vcc-pg-supply =3D <&reg_aldo1>;
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
+				regulator-name =3D "vcc-pl";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc-ac200";
+				regulator-enable-ramp-delay =3D <100000>;
+			};
+
+			reg_aldo3: aldo3 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc25-dram";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc-bias-pll";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc-efuse-pcie-hdmi-io";
+			};
+
+			reg_bldo3: bldo3 {
+				regulator-always-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc-dcxoio";
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
+				regulator-name =3D "vcc-3v3";
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc-wifi-1";
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc-wifi-2";
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt =3D <810000>;
+				regulator-max-microvolt =3D <1080000>;
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
+&r_pio {
+	/*
+	 * PL0 and PL1 are used for PMIC I2C
+	 * don't enable the pl-supply else
+	 * it will fail at boot
+	 *
+	 * vcc-pl-supply =3D <&reg_aldo1>;
+	 */
+	vcc-pm-supply =3D <&reg_aldo1>;
+};
+
+&uart0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&uart0_ph_pins>;
+	status =3D "okay";
+};
+
+&usb2otg {
+	dr_mode =3D "host";
+	status =3D "okay";
+};
+
+&usb2phy {
+	usb0_vbus-supply =3D <&reg_vcc5v>;
+	status =3D "okay";
+};
--=20
2.17.1

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
