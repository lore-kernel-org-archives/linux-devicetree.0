From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6dl-sabreauto: update opp table for auto part
Date: Mon, 8 Apr 2019 07:44:21 +0000
Message-ID: <1554709166-21952-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Update i.MX6DL automotive part's opp table according to i.MX6DL
automotive datasheet Rev.9, 11/2018, it adds 996MHz set-point
support as below:

LDO enabled(min value):
996MHz: VDDARM: 1.275V, VDDSOC: 1.175V;
792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
396MHz: VDDARM: 1.125V, VDDSOC: 1.150V;

Adding 25mV to cover board IR drop, for LDO enabled mode of 996MHz,
as the max value of LDO output can NOT exceed 1.3V, so 25mV is NOT
added for VDDARM.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6dl-sabreauto.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-sabreauto.dts b/arch/arm/boot/dts/imx=
6dl-sabreauto.dts
index 660d52a..ff3283c8 100644
--- a/arch/arm/boot/dts/imx6dl-sabreauto.dts
+++ b/arch/arm/boot/dts/imx6dl-sabreauto.dts
@@ -11,3 +11,18 @@
 	model =3D "Freescale i.MX6 DualLite/Solo SABRE Automotive Board";
 	compatible =3D "fsl,imx6dl-sabreauto", "fsl,imx6dl";
 };
+
+&cpu0 {
+	operating-points =3D <
+		/* kHz    uV */
+		996000  1275000
+		792000  1175000
+		396000  1150000
+	>;
+	fsl,soc-operating-points =3D <
+		/* ARM kHz  SOC-PU uV */
+		996000	1200000
+		792000	1175000
+		396000	1175000
+	>;
+};
--=20
2.7.4
