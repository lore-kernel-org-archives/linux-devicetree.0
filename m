From: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
Subject: [PATCH v2] arm: dts: imx6qdl: add gpio expander pca9535
Date: Fri, 19 Jul 2019 12:46:15 +0200
Message-ID: <20190719104615.5329-1-gilles.doffe@savoirfairelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: jerome.oufella@savoirfairelinux.com, rennes@savoirfairelinux.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

The pca9535 gpio expander is present on the Rex baseboard, but missing
from the dtsi.

Add the new gpio controller and the associated interrupt line
MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.

Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
---
 arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6q=
dl-rex.dtsi
index 97f1659144ea..b517efb22fcb 100644
--- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
@@ -136,6 +136,19 @@
 		compatible =3D "atmel,24c02";
 		reg =3D <0x57>;
 	};
+
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
 };
=20
 &i2c3 {
@@ -237,6 +250,12 @@
 			>;
 		};
=20
+		pinctrl_pca9535: pca9535 {
+			fsl,pins =3D <
+				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x00017059
+		   >;
+		};
+
 		pinctrl_uart1: uart1grp {
 			fsl,pins =3D <
 				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
--=20
2.19.1
