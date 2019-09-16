From: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
Subject: [PATCH v3] ARM: dts: imx6qdl-rex: add gpio expander pca9535
Date: Mon, 16 Sep 2019 12:43:53 +0200
Message-ID: <20190916104353.7278-1-gilles.doffe@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: rennes@savoirfairelinux.com, jerome.oufella@savoirfairelinux.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The pca9535 gpio expander is present on the Rex baseboard, but missing
from the dtsi.
The pca9535 is on i2c2 bus which is common to the three SOM
variants (Basic/Pro/Ultra), thus it is activated by default.

Add also the new gpio controller and the associated interrupt line
MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.

Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
---
 arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6q=
dl-rex.dtsi
index 97f1659144ea..8a748ca1b108 100644
--- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
@@ -132,6 +132,19 @@
 	pinctrl-0 =3D <&pinctrl_i2c2>;
 	status =3D "okay";
=20
+	pca9535: gpio8@27 {
+		compatible =3D "nxp,pca9535";
+		reg =3D <0x27>;
+		gpio-controller;
+		#gpio-cells =3D <2>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_pca9535>;
+		interrupt-parent =3D <&gpio6>;
+		interrupts =3D <16 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells =3D <2>;
+	};
+
 	eeprom@57 {
 		compatible =3D "atmel,24c02";
 		reg =3D <0x57>;
@@ -237,6 +250,12 @@
 			>;
 		};
=20
+		pinctrl_pca9535: pca9535 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x17059
+		   >;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
--=20
2.20.1
