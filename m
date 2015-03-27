From: Vagrant Cascadian <vagrant@debian.org>
Subject: [PATCH] ARM: dts: imx5: Add dts files for USB armory.
Date: Fri, 27 Mar 2015 13:23:00 -0700
Message-ID: <87h9t6i40r.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4981832034621890852=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrej Rosano <andrej@inversepath.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4981832034621890852==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Add support for the USB armory board by Inverse Path. This board
features a Freescale iMX53 SoC, 512MB RAM, and USB OTG operating in
either peripheral or host mode, and 5 GPIO pins.

One .dtb is generated for operating in peripheral mode, and one is
generated for operating in host mode.

Signed-off-by: Vagrant Cascadian <vagrant@debian.org>
Cc: Andrej Rosano <andrej@inversepath.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
=2D--
 arch/arm/boot/dts/Makefile                      |   2 +
 arch/arm/boot/dts/imx53-usbarmory-host_mode.dts |  17 +++
 arch/arm/boot/dts/imx53-usbarmory.dts           |  13 ++
 arch/arm/boot/dts/imx53-usbarmory.dtsi          | 183 ++++++++++++++++++++=
++++
 4 files changed, 215 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory-host_mode.dts
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dts
 create mode 100644 arch/arm/boot/dts/imx53-usbarmory.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a1c776b..bd2258b 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -244,6 +244,8 @@ dtb-$(CONFIG_SOC_IMX53) +=3D \
 	imx53-smd.dtb \
 	imx53-tx53-x03x.dtb \
 	imx53-tx53-x13x.dtb \
+	imx53-usbarmory.dtb \
+	imx53-usbarmory-host_mode.dtb \
 	imx53-voipac-bsb.dtb
 dtb-$(CONFIG_SOC_IMX6Q) +=3D \
 	imx6dl-aristainetos_4.dtb \
diff --git a/arch/arm/boot/dts/imx53-usbarmory-host_mode.dts b/arch/arm/boo=
t/dts/imx53-usbarmory-host_mode.dts
new file mode 100644
index 0000000..a94cb1d
=2D-- /dev/null
+++ b/arch/arm/boot/dts/imx53-usbarmory-host_mode.dts
@@ -0,0 +1,17 @@
+/*
+ * Copyright 2015 Inverse Path, S.r.l.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "imx53-usbarmory.dtsi"
+
+&usbotg {
+	dr_mode =3D "host";
+};
diff --git a/arch/arm/boot/dts/imx53-usbarmory.dts b/arch/arm/boot/dts/imx5=
3-usbarmory.dts
new file mode 100644
index 0000000..c86a4d8
=2D-- /dev/null
+++ b/arch/arm/boot/dts/imx53-usbarmory.dts
@@ -0,0 +1,13 @@
+/*
+ * Copyright 2015 Inverse Path, S.r.l.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+#include "imx53-usbarmory.dtsi"
diff --git a/arch/arm/boot/dts/imx53-usbarmory.dtsi b/arch/arm/boot/dts/imx=
53-usbarmory.dtsi
new file mode 100644
index 0000000..b4a9052
=2D-- /dev/null
+++ b/arch/arm/boot/dts/imx53-usbarmory.dtsi
@@ -0,0 +1,183 @@
+/*
+ * Copyright 2015 Inverse Path, S.r.l.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include "imx53.dtsi"
+
+/ {
+	model =3D "Inverse Path USB armory";
+	compatible =3D "inversepath,imx53-usbarmory", "fsl,imx53";
+};
+
+/ {
+	chosen {
+		stdout-path =3D &uart1;
+	};
+
+	memory {
+		reg =3D <0x70000000 0x20000000>;
+	};
+
+	leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&led_pin_gpio4_27>;
+
+		user {
+			label =3D "LED";
+			gpios =3D <&gpio4 27 0>;
+			linux,default-trigger =3D "heartbeat";
+		};
+	};
+};
+
+&esdhc1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_esdhc1>;
+	status =3D "okay";
+};
+
+&iomuxc {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_hog>;
+
+	imx53-usbarmory {
+		pinctrl_hog: hoggrp {
+			fsl,pins =3D <
+				MX53_PAD_GPIO_0__CCM_SSI_EXT1_CLK 0x80000000
+				MX53_PAD_GPIO_8__GPIO1_8          0x80000000
+				MX53_PAD_PATA_DATA14__GPIO2_14    0x80000000
+				MX53_PAD_PATA_DATA15__GPIO2_15    0x80000000
+				MX53_PAD_EIM_DA11__GPIO3_11       0x80000000
+				MX53_PAD_EIM_DA12__GPIO3_12       0x80000000
+				MX53_PAD_PATA_DA_0__GPIO7_6       0x80000000
+				MX53_PAD_PATA_DA_2__GPIO7_8	  0x80000000
+				MX53_PAD_GPIO_16__GPIO7_11        0x80000000
+			>;
+		};
+
+		led_pin_gpio4_27: led_gpio4_27@0 {
+			fsl,pins =3D <
+				MX53_PAD_DISP0_DAT6__GPIO4_27 0x80000000
+			>;
+		};
+
+		pinctrl_esdhc1: esdhc1grp {
+			fsl,pins =3D <
+				MX53_PAD_SD1_DATA0__ESDHC1_DAT0		0x1d5
+				MX53_PAD_SD1_DATA1__ESDHC1_DAT1		0x1d5
+				MX53_PAD_SD1_DATA2__ESDHC1_DAT2		0x1d5
+				MX53_PAD_SD1_DATA3__ESDHC1_DAT3		0x1d5
+				MX53_PAD_SD1_CMD__ESDHC1_CMD		0x1d5
+				MX53_PAD_SD1_CLK__ESDHC1_CLK		0x1d5
+			>;
+		};
+
+		pinctrl_i2c1: i2c1grp {
+			fsl,pins =3D <
+				MX53_PAD_CSI0_DAT8__I2C1_SDA	0xc0000000
+				MX53_PAD_CSI0_DAT9__I2C1_SCL	0xc0000000
+			>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins =3D <
+				MX53_PAD_CSI0_DAT10__UART1_TXD_MUX	0x1e4
+				MX53_PAD_CSI0_DAT11__UART1_RXD_MUX	0x1e4
+			>;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	status =3D "okay";
+};
+
+&vpu {
+	status =3D "okay";
+};
+
+&usbotg {
+	dr_mode =3D "peripheral";
+	status =3D "okay";
+};
+
+&i2c1 {
+	ltc3589: pmic@34 {
+		compatible =3D "lltc,ltc3589-2";
+		reg =3D <0x34>;
+
+		regulators {
+			sw1_reg: sw1 {
+				regulator-min-microvolt =3D <591930>;
+				regulator-max-microvolt =3D <1224671>;
+				lltc,fb-voltage-divider =3D <100000 158000>;
+				regulator-ramp-delay =3D <7000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw2_reg: sw2 {
+				regulator-min-microvolt =3D <704123>;
+				regulator-max-microvolt =3D <1456803>;
+				lltc,fb-voltage-divider =3D <180000 191000>;
+				regulator-ramp-delay =3D <7000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sw3_reg: sw3 {
+				regulator-min-microvolt =3D <1341250>;
+				regulator-max-microvolt =3D <2775000>;
+				lltc,fb-voltage-divider =3D <270000 100000>;
+				regulator-ramp-delay =3D <7000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			bb_out_reg: bb-out {
+				regulator-min-microvolt =3D <3387341>;
+				regulator-max-microvolt =3D <3387341>;
+				lltc,fb-voltage-divider =3D <511000 158000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+			ldo1_reg: ldo1 {
+				regulator-min-microvolt =3D <1306329>;
+				regulator-max-microvolt =3D <1306329>;
+				lltc,fb-voltage-divider =3D <100000 158000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-min-microvolt =3D <704123>;
+				regulator-max-microvolt =3D <1456806>;
+				lltc,fb-voltage-divider =3D <180000 191000>;
+				regulator-ramp-delay =3D <7000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: ldo3 {
+				regulator-min-microvolt =3D <2800000>;
+				regulator-max-microvolt =3D <2800000>;
+				regulator-boot-on;
+			};
+
+			ldo4_reg: ldo4 {
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <3200000>;
+			};
+		};
+	};
+};
=2D-=20
2.1.4


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVFbwlAAoJELeLgtSBS5G2R/QP/ioePVZwNgMHsyuwO6DHDgzd
qf5JIBag1iV/MRNYTukMYHfXX8Iz3P1MXCybpFTFccIM1p41jCiPdR+qfDli9iP9
bPbYoRpEniPIZw7Ffh3i26e6JsB9ZFOPMeHHOuCudVyySYu0DaXWNAdgyrwGt2Jx
1E7DfsSEgwLVhQwpsqENiBi4uItBZtNbpbt2hGNIzZhVFqieHR//xvFcQ4yI6n/G
4EOYN1eMsvuRDQLeT/0HOHv2PDEJPpdlE5jRNUcJtYkMaElnlyIzIg0/8xZIHHSA
CUXkgmkIfomFoEZbLaYfAjRmm6RlgLl+XYb3FiZR6XHljeQHWSwpYqdT+SNqvRfN
9k8I9Z7BwxTLKP16yo7e8GhFYm/MFdu6TjyhmjstJguiKslxIgnSl8ISz6ca/+XI
TG+RJkQ8eE5tCKX0+5/7Dx6dY1LwsUgGAYWyEsGC8xRAZ8iIKTIzF65Tkuf5Czwf
mjR+S7iOe2zEPYR2Rg279vaMHnzU4jJc6iZ5Uy6TwmLARgeeH9ydnV+5x8kweP7c
wK1CDTuzWDMow9lOWW5ulRJOEPZMipwZGikAUx5LfzVc37BthOovn53M7EPCgcK1
RiicTbDup6dKqs7E9bizBZE/SJs/83hWt15+tBVS5327oC819gkuhN3a9F/Hr9iY
2M54mSMiHZmdp8aDMhhA
=QFZm
-----END PGP SIGNATURE-----
--=-=-=--


--===============4981832034621890852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4981832034621890852==--
