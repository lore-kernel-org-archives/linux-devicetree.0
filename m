From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 4/5] ARM: dts: imx6sll-evk: Assign corresponding power
 supply for vdd3p0
Date: Sun, 12 May 2019 09:57:31 +0000
Message-ID: <1557654739-12564-4-git-send-email-Anson.Huang@nxp.com>
References: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-ID: <077750D89E1A5C4B9C170FD55306B912@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX6SLL EVK board, sw2 supplies vdd3p0 LDO, this patch assigns
corresponding power supply for vdd3p0 to avoid confusion by below log:

vdd3p0: supplied by regulator-dummy

With this patch, the power supply is more accurate:

vdd3p0: supplied by SW2

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No code change, just resend patch with correct encoding.
---
 arch/arm/boot/dts/imx6sll-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-=
evk.dts
index 4a31a41..78809ea 100644
--- a/arch/arm/boot/dts/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/imx6sll-evk.dts
@@ -265,6 +265,10 @@
 	status =3D "okay";
 };
=20
+&reg_3p0 {
+	vin-supply =3D <&sw2_reg>;
+};
+
 &uart1 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart1>;
--=20
2.7.4
