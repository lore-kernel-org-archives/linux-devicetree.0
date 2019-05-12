From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 2/5] ARM: dts: imx7d-sdb: Assign corresponding power
 supply for LDOs
Date: Sun, 12 May 2019 09:57:24 +0000
Message-ID: <1557654739-12564-2-git-send-email-Anson.Huang@nxp.com>
References: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <028EE5896BAD984DB30BB8836620C386@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX7D SDB board, sw2 supplies 1p0d/1p2 LDO, this patch assigns
corresponding power supply for 1p0d/1p2 LDO to avoid confusion by
below log:

vdd1p0d: supplied by regulator-dummy
vdd1p2: supplied by regulator-dummy

With this patch, the power supply is more accurate:

vdd1p0d: supplied by SW2
vdd1p2: supplied by SW2

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx7d-sdb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.=
dts
index 202922e..efc83bc 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -379,6 +379,14 @@
 	status =3D "okay";
 };
=20
+&reg_1p0d {
+	vin-supply =3D <&sw2_reg>;
+};
+
+&reg_1p2 {
+	vin-supply =3D <&sw2_reg>;
+};
+
 &uart1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart1>;
--=20
2.7.4
