From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq: Add RTC support
Date: Thu, 31 Jan 2019 15:01:22 +0000
Message-ID: <1548946870-29037-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Baruch Siach <baruch@tkos.co.il>
Cc: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add RTC support for i.MX8MQ.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 892063a..49b14af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -240,6 +240,20 @@
 				interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 			};
=20
+			snvs: snvs@30370000 {
+				compatible =3D "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
+				reg =3D <0x30370000 0x10000>;
+
+				snvs_rtc: snvs-rtc-lp{
+					compatible =3D "fsl,sec-v4.0-mon-rtc-lp";
+					regmap =3D<&snvs>;
+					offset =3D <0x34>;
+					interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+			};
+
 			clk: clock-controller@30380000 {
 				compatible =3D "fsl,imx8mq-ccm";
 				reg =3D <0x30380000 0x10000>;
--=20
2.7.4
