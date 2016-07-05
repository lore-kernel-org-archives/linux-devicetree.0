From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: imx6sx-udoo-neo: Add SD
Date: Tue,  5 Jul 2016 06:04:10 +0200
Message-ID: <1467691450-22975-4-git-send-email-afaerber@suse.de>
References: <1467691450-22975-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467691450-22975-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the SDHC node and model the SDIO_PWR GPIO as a regulator.
Use the SD card as default trigger for the red LED.

Cc: Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
=20

 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi | 34 ++++++++++++++++++++++++++=
++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts=
/imx6sx-udoo-neo.dtsi
index e074409644d8..85f5e8606dab 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -56,6 +56,7 @@
 			label =3D "udoo-neo:red:mmc";
 			gpios =3D <&gpio6 0 GPIO_ACTIVE_HIGH>;
 			default-state =3D "off";
+			linux,default-trigger =3D "mmc0";
 		};
=20
 		orange {
@@ -64,6 +65,17 @@
 			default-state =3D "keep";
 		};
 	};
+
+	sdio_pwr_reg: sd-gpio-regulator {
+		compatible =3D "regulator-fixed";
+		gpio =3D <&gpio6 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name =3D "SDIO_PWR";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
=20
 &cpu0 {
@@ -230,6 +242,17 @@
 				<MX6SX_PAD_CSI_DATA06__UART6_RTS_B	0x1b0b1>,
 				<MX6SX_PAD_CSI_DATA07__UART6_CTS_B	0x1b0b1>;
 		};
+
+		pinctrl_usdhc2: usdhc2grp {
+			fsl,pins =3D
+				<MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x17059>,
+				<MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x10059>,
+				<MX6SX_PAD_SD2_DATA0__USDHC2_DATA0	0x17059>,
+				<MX6SX_PAD_SD2_DATA1__USDHC2_DATA1	0x17059>,
+				<MX6SX_PAD_SD2_DATA2__USDHC2_DATA2	0x17059>,
+				<MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x17059>,
+				<MX6SX_PAD_SD1_DATA0__GPIO6_IO_2	0x17059>; /* CD */
+		};
 	};
 };
=20
@@ -259,3 +282,14 @@
 	uart-has-rtscts;
 	status =3D "disabled";
 };
+
+&usdhc2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usdhc2>;
+	bus-width =3D <4>;
+	cd-gpios =3D <&gpio6 2 GPIO_ACTIVE_LOW>;
+	no-1-8-v;
+	keep-power-in-suspend;
+	wakeup-source;
+	status =3D "okay";
+};
--=20
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
