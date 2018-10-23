From: Clark Wang <xiaoning.wang@nxp.com>
Subject: [PATCH] ARM: dts: fix imx7d boot spi dma setup error
Date: Tue, 23 Oct 2018 08:36:17 +0000
Message-ID: <20181023083356.17579-1-xiaoning.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>
List-Id: devicetree@vger.kernel.org

Add dmas and dma-names for ecspi1~4 to fix kernel boot error:
"spi_imx 30840000.ecspi: dma setup error -19, use pio".

Signed-off-by: Xiaoning Wang <xiaoning.wang@nxp.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index aa8df7d93b2e..043e39124c43 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -651,6 +651,8 @@
 				clocks =3D <&clks IMX7D_ECSPI4_ROOT_CLK>,
 					<&clks IMX7D_ECSPI4_ROOT_CLK>;
 				clock-names =3D "ipg", "per";
+				dmas =3D <&sdma 6 7 1>, <&sdma 7 7 2>;
+				dma-names =3D "rx", "tx";
 				status =3D "disabled";
 			};
=20
@@ -732,6 +734,8 @@
 					clocks =3D <&clks IMX7D_ECSPI1_ROOT_CLK>,
 						<&clks IMX7D_ECSPI1_ROOT_CLK>;
 					clock-names =3D "ipg", "per";
+					dmas =3D <&sdma 0 7 1>, <&sdma 1 7 2>;
+					dma-names =3D "rx", "tx";
 					status =3D "disabled";
 				};
=20
@@ -744,6 +748,8 @@
 					clocks =3D <&clks IMX7D_ECSPI2_ROOT_CLK>,
 						<&clks IMX7D_ECSPI2_ROOT_CLK>;
 					clock-names =3D "ipg", "per";
+					dmas =3D <&sdma 2 7 1>, <&sdma 3 7 2>;
+					dma-names =3D "rx", "tx";
 					status =3D "disabled";
 				};
=20
@@ -756,6 +762,8 @@
 					clocks =3D <&clks IMX7D_ECSPI3_ROOT_CLK>,
 						<&clks IMX7D_ECSPI3_ROOT_CLK>;
 					clock-names =3D "ipg", "per";
+					dmas =3D <&sdma 4 7 1>, <&sdma 5 7 2>;
+					dma-names =3D "rx", "tx";
 					status =3D "disabled";
 				};
=20
--=20
2.17.1
