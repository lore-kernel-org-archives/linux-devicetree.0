From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2 2/3] arm64: dts: imx8mq: Add the buck vdd_arm regulator
Date: Fri, 15 Feb 2019 18:07:23 +0000
Message-ID: <1550254032-16451-3-git-send-email-abel.vesa@nxp.com>
References: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550254032-16451-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Angus Ainslie <angus.ainslie@puri.sm>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

According to the schematics, this is a MP2147 switch converter
which is controlled by GPIO1_IO13. When set the gpio is set to
high the regulator output is set to 0.9V. When the gpio is set
to low the regulator output is set to 1V.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 36 ++++++++++++++++++++++++=
++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot=
/dts/freescale/imx8mq-evk.dts
index 54737bf..e5da3dd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -31,6 +31,35 @@
 		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	buck2_reg: buck2 {
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_buck2>;
+		compatible =3D "regulator-gpio";
+		regulator-name =3D "vdd_arm";
+		regulator-min-microvolt =3D <900000>;
+		regulator-max-microvolt =3D <1000000>;
+		gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
+		states =3D <1000000 0x0
+			  900000 0x1>;
+		enable-active-high;
+	};
+};
+
+&A53_0 {
+	cpu-supply =3D <&buck2_reg>;
+};
+
+&A53_1 {
+	cpu-supply =3D <&buck2_reg>;
+};
+
+&A53_2 {
+	cpu-supply =3D <&buck2_reg>;
+};
+
+&A53_3 {
+	cpu-supply =3D <&buck2_reg>;
 };
=20
 &fec1 {
@@ -203,6 +232,13 @@
 };
=20
 &iomuxc {
+	pinctrl_buck2: vddarmgrp {
+		fsl,pins =3D <
+			MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13		0x19
+		>;
+
+	};
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins =3D <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
--=20
2.7.4
