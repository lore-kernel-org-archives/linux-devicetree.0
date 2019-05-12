From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 5/5] ARM: dts: imx6sx-sdb: Assign corresponding power
 supply for LDOs
Date: Sun, 12 May 2019 09:57:35 +0000
Message-ID: <1557654739-12564-5-git-send-email-Anson.Huang@nxp.com>
References: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <D0E80C7DABDA9F4681E1DD72542CF8DE@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX6SX SDB board, vgen6 supplies vdd1p1/vdd2p5 LDO and
sw2 supplies vdd3p0 LDO, this patch assigns corresponding power
supply for vdd1p1/vdd2p5/vdd3p0 to avoid confusion by below log:

vdd1p1: supplied by regulator-dummy
vdd3p0: supplied by regulator-dummy
vdd2p5: supplied by regulator-dummy

With this patch, the power supply is more accurate:

vdd1p1: supplied by VGEN6
vdd3p0: supplied by SW2
vdd2p5: supplied by VGEN6

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx6sx-sdb-reva.dts | 12 ++++++++++++
 arch/arm/boot/dts/imx6sx-sdb.dts      | 12 ++++++++++++
 arch/arm/boot/dts/imx6sx.dtsi         |  6 +++---
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts b/arch/arm/boot/dts/imx6=
sx-sdb-reva.dts
index 00c4854..5b3d6c10 100644
--- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
@@ -154,3 +154,15 @@
 	enable-active-high;
 	vin-supply =3D <&reg_can_en>;
 };
+
+&reg_vdd1p1 {
+	vin-supply =3D <&vgen6_reg>;
+};
+
+&reg_vdd3p0 {
+	vin-supply =3D <&sw2_reg>;
+};
+
+&reg_vdd2p5 {
+	vin-supply =3D <&vgen6_reg>;
+};
diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sd=
b.dts
index 998e3e1..10f6da8 100644
--- a/arch/arm/boot/dts/imx6sx-sdb.dts
+++ b/arch/arm/boot/dts/imx6sx-sdb.dts
@@ -137,6 +137,18 @@
 	vin-supply =3D <&sw1a_reg>;
 };
=20
+&reg_vdd1p1 {
+	vin-supply =3D <&vgen6_reg>;
+};
+
+&reg_vdd3p0 {
+	vin-supply =3D <&sw2_reg>;
+};
+
+&reg_vdd2p5 {
+	vin-supply =3D <&vgen6_reg>;
+};
+
 &reg_can_stby {
 	/* Transceiver EN/STBY is active low on RevB board */
 	gpio =3D <&gpio4 27 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index b16a123..bbdfdd8 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -600,7 +600,7 @@
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
=20
-				regulator-1p1 {
+				reg_vdd1p1: regulator-1p1 {
 					compatible =3D "fsl,anatop-regulator";
 					regulator-name =3D "vdd1p1";
 					regulator-min-microvolt =3D <1000000>;
@@ -615,7 +615,7 @@
 					anatop-enable-bit =3D <0>;
 				};
=20
-				regulator-3p0 {
+				reg_vdd3p0: regulator-3p0 {
 					compatible =3D "fsl,anatop-regulator";
 					regulator-name =3D "vdd3p0";
 					regulator-min-microvolt =3D <2800000>;
@@ -630,7 +630,7 @@
 					anatop-enable-bit =3D <0>;
 				};
=20
-				regulator-2p5 {
+				reg_vdd2p5: regulator-2p5 {
 					compatible =3D "fsl,anatop-regulator";
 					regulator-name =3D "vdd2p5";
 					regulator-min-microvolt =3D <2250000>;
--=20
2.7.4
