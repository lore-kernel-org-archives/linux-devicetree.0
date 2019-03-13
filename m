From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm64: dts: imx8qxp: add lsio_mu2 node
Date: Wed, 13 Mar 2019 09:24:42 +0000
Message-ID: <20190313093650.18693-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>, Peng Fan <peng.fan@nxp.com>
List-Id: devicetree@vger.kernel.org

Add lsio_mu2 node which could be used communicate with SCU.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 16766838ac77..64eecd6cb1e9 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -339,6 +339,14 @@
 			#mbox-cells =3D <2>;
 		};
=20
+		lsio_mu2: mailbox@5d1d0000 {
+			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg =3D <0x5d1d0000 0x10000>;
+			interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells =3D <2>;
+			status =3D "disabled";
+		};
+
 		lsio_mu3: mailbox@5d1e0000 {
 			compatible =3D "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
 			reg =3D <0x5d1e0000 0x10000>;
--=20
2.16.4
