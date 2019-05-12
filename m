From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 1/5] ARM: dts: imx6qdl-sabresd: Assign corresponding
 power supply for LDOs
Date: Sun, 12 May 2019 09:57:20 +0000
Message-ID: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <32D5768BD4DE3F43A90899F857CA9E6C@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX6Q/DL SabreSD board, vgen5 supplies vdd1p1/vdd2p5 LDO and
sw2 supplies vdd3p0 LDO, this patch assigns corresponding power
supply for vdd1p1/vdd2p5/vdd3p0 to avoid confusion by below log:

vdd1p1: supplied by regulator-dummy
vdd3p0: supplied by regulator-dummy
vdd2p5: supplied by regulator-dummy

With this patch, the power supply is more accurate:

vdd1p1: supplied by VGEN5
vdd3p0: supplied by SW2
vdd2p5: supplied by VGEN5

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/imx6qdl.dtsi         |  6 +++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx=
6qdl-sabresd.dtsi
index 185fb17..11103a4 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -745,6 +745,18 @@
        vin-supply =3D <&sw1c_reg>;
 };
=20
+&reg_vdd1p1 {
+	vin-supply =3D <&vgen5_reg>;
+};
+
+&reg_vdd3p0 {
+	vin-supply =3D <&sw2_reg>;
+};
+
+&reg_vdd2p5 {
+	vin-supply =3D <&vgen5_reg>;
+};
+
 &snvs_poweroff {
 	status =3D "okay";
 };
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index 664f7b5..929fc7d 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -701,7 +701,7 @@
 					     <0 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 127 IRQ_TYPE_LEVEL_HIGH>;
=20
-				regulator-1p1 {
+				reg_vdd1p1: regulator-1p1 {
 					compatible =3D "fsl,anatop-regulator";
 					regulator-name =3D "vdd1p1";
 					regulator-min-microvolt =3D <1000000>;
@@ -716,7 +716,7 @@
 					anatop-enable-bit =3D <0>;
 				};
=20
-				regulator-3p0 {
+				reg_vdd3p0: regulator-3p0 {
 					compatible =3D "fsl,anatop-regulator";
 					regulator-name =3D "vdd3p0";
 					regulator-min-microvolt =3D <2800000>;
@@ -731,7 +731,7 @@
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
