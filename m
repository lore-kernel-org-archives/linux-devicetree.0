From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] arm64: dts: imx8qxp: Add gpio alias
Date: Tue, 14 May 2019 04:57:17 +0000
Message-ID: <1557809536-749-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <14512C07EAFE424A98EC3DACC8F6E91C@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX8QXP GPIO alias for kernel GPIO driver usage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index b17c22e..923705e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -22,6 +22,14 @@
 		mmc2 =3D &usdhc3;
 		serial0 =3D &adma_lpuart0;
 		mu1 =3D &lsio_mu1;
+		gpio0 =3D &lsio_gpio0;
+		gpio1 =3D &lsio_gpio1;
+		gpio2 =3D &lsio_gpio2;
+		gpio3 =3D &lsio_gpio3;
+		gpio4 =3D &lsio_gpio4;
+		gpio5 =3D &lsio_gpio5;
+		gpio6 =3D &lsio_gpio6;
+		gpio7 =3D &lsio_gpio7;
 	};
=20
 	cpus {
--=20
2.7.4
