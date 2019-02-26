From: Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/5] arm64: dts: imx8mq: Add SDMA nodes
Date: Tue, 26 Feb 2019 07:08:12 +0000
Message-ID: <20190226070742.30551-2-daniel.baluta@nxp.com>
References: <20190226070742.30551-1-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190226070742.30551-1-daniel.baluta@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Aisheng
List-Id: devicetree@vger.kernel.org

SDMA1 is part of AIPS-3 region and SDMA2 is part
of AIPS-1 region.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
[initial submit in i.MX internal tree]
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
[adaptation for linux-next]
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 9155bd4784eb..8cafec17726b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -234,6 +234,17 @@
 				status =3D "disabled";
 			};
=20
+			sdma2: sdma@302c0000 {
+				compatible =3D "fsl,imx7d-sdma";
+				reg =3D <0x302c0000 0x10000>;
+				interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_SDMA2_ROOT>,
+					 <&clk IMX8MQ_CLK_SDMA2_ROOT>;
+				clock-names =3D "ipg", "ahb";
+				#dma-cells =3D <3>;
+				fsl,sdma-ram-script-name =3D "imx/sdma/sdma-imx7d.bin";
+			};
+
 			iomuxc: iomuxc@30330000 {
 				compatible =3D "fsl,imx8mq-iomuxc";
 				reg =3D <0x30330000 0x10000>;
@@ -575,6 +586,17 @@
 				status =3D "disabled";
 			};
=20
+			sdma1: sdma@30bd0000 {
+				compatible =3D "fsl,imx7d-sdma";
+				reg =3D <0x30bd0000 0x10000>;
+				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_SDMA1_ROOT>,
+					 <&clk IMX8MQ_CLK_SDMA1_ROOT>;
+				clock-names =3D "ipg", "ahb";
+				#dma-cells =3D <3>;
+				fsl,sdma-ram-script-name =3D "imx/sdma/sdma-imx7d.bin";
+			};
+
 			fec1: ethernet@30be0000 {
 				compatible =3D "fsl,imx8mq-fec", "fsl,imx6sx-fec";
 				reg =3D <0x30be0000 0x10000>;
--=20
2.17.1
