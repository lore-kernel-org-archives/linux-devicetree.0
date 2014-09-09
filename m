From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: imx28-tx28: add spi-gpio as alternative for spi-mxs
Date: Tue,  9 Sep 2014 13:26:02 +0200
Message-ID: <1410261963-27956-4-git-send-email-LW@KARO-electronics.de>
References: <1410261963-27956-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410261963-27956-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The spi-mxs driver does not allow full duplex SPI transfers. The
spi-gpio driver may be used as an alternative if this is required.

Make the choice between those drivers easier for the end user by
providing settings for both drivers.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx28-tx28.dts |   54 ++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28=
-tx28.dts
index cfe6b31..81d4eb4 100644
--- a/arch/arm/boot/dts/imx28-tx28.dts
+++ b/arch/arm/boot/dts/imx28-tx28.dts
@@ -27,6 +27,8 @@
 		lcdif =3D &lcdif;
 		lcdif_23bit_pins =3D &tx28_lcdif_23bit_pins;
 		lcdif_24bit_pins =3D &lcdif_24bit_pins_a;
+		spi_gpio =3D &spi_gpio;
+		spi_mxs =3D &ssp3;
 		stk5led =3D &user_led;
 		usbotg =3D &usb0;
 	};
@@ -203,6 +205,44 @@
 		col-scan-delay-us =3D <5000>;
 		linux,no-autorepeat;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible =3D "spi-gpio";
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&tx28_spi_gpio_pins>;
+
+		gpio-sck =3D <&gpio2 24 GPIO_ACTIVE_HIGH>;
+		gpio-mosi =3D <&gpio2 25 GPIO_ACTIVE_HIGH>;
+		gpio-miso =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		num-chipselects =3D <3>;
+		cs-gpios =3D <
+			&gpio2 27 GPIO_ACTIVE_LOW
+			&gpio3 8 GPIO_ACTIVE_LOW
+			&gpio3 9 GPIO_ACTIVE_LOW
+		>;
+		/* enable this and disable ssp3 below, if you need full duplex SPI t=
ransfer */
+		status =3D "disabled";
+
+		spi@0 {
+			compatible =3D "spidev";
+			reg =3D <0>;
+			spi-max-frequency =3D <57600000>;
+		};
+
+		spi@1 {
+			compatible =3D "spidev";
+			reg =3D <1>;
+			spi-max-frequency =3D <57600000>;
+		};
+
+		spi@2 {
+			compatible =3D "spidev";
+			reg =3D <2>;
+			spi-max-frequency =3D <57600000>;
+		};
+	};
 };
=20
 /* 2nd TX-Std UART - (A)UART1  */
@@ -558,6 +598,20 @@
 		fsl,pull-up =3D <MXS_PULL_DISABLE>;
 	};
=20
+	tx28_spi_gpio_pins: spi-gpiogrp {
+		fsl,pinmux-ids =3D <
+			MX28_PAD_AUART2_RX__GPIO_3_8
+			MX28_PAD_AUART2_TX__GPIO_3_9
+			MX28_PAD_SSP3_SCK__GPIO_2_24
+			MX28_PAD_SSP3_MOSI__GPIO_2_25
+			MX28_PAD_SSP3_MISO__GPIO_2_26
+			MX28_PAD_SSP3_SS0__GPIO_2_27
+		>;
+		fsl,drive-strength =3D <MXS_DRIVE_8mA>;
+		fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up =3D <MXS_PULL_DISABLE>;
+	};
+
 	tx28_tsc2007_pins: tx28-tsc2007-pins {
 		fsl,pinmux-ids =3D <
 			MX28_PAD_SAIF0_MCLK__GPIO_3_20 /* TSC2007 IRQ */
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
