From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm64: dts: imx8qxp: fix mbox-cells
Date: Wed, 13 Mar 2019 09:24:19 +0000
Message-ID: <20190313093626.18589-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>
List-Id: devicetree@vger.kernel.org

Currently lsio_mu1 is used by Linux Kernel with mbox-cells as 2, but
actually mu0-4 could be used to communicate with SCU. So fix the
mbox-cells.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95ed488..16766838ac77 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -328,7 +328,7 @@
 			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
 			reg =3D <0x5d1b0000 0x10000>;
 			interrupts =3D <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells =3D <0>;
+			#mbox-cells =3D <2>;
 			status =3D "disabled";
 		};
=20
@@ -343,7 +343,7 @@
 			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
 			reg =3D <0x5d1e0000 0x10000>;
 			interrupts =3D <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells =3D <0>;
+			#mbox-cells =3D <2>;
 			status =3D "disabled";
 		};
=20
@@ -351,7 +351,7 @@
 			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
 			reg =3D <0x5d1f0000 0x10000>;
 			interrupts =3D <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
-			#mbox-cells =3D <0>;
+			#mbox-cells =3D <2>;
 			status =3D "disabled";
 		};
=20
--=20
2.16.4
