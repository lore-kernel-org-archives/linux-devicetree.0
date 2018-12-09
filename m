From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v5 5/6] arm64: dts: imx8mq: add watchdog devices
Date: Sun, 9 Dec 2018 14:26:10 +0000
Message-ID: <1544365552-30270-6-git-send-email-abel.vesa@nxp.com>
References: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544365552-30270-1-git-send-email-abel.vesa@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>, Abel Vesa <abel.vesa@nxp.com>, Baruch Siach <baruch@tkos.co.il>
List-Id: devicetree@vger.kernel.org

From: Baruch Siach <baruch@tkos.co.il>

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 3703bca..8e9d6d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -228,6 +228,30 @@
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
 			};
+
+			wdog1: watchdog@30280000 {
+				compatible =3D "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg =3D <0x30280000 0x10000>;
+				interrupts =3D <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_WDOG1_ROOT>;
+				status =3D "disabled";
+			};
+
+			wdog2: watchdog@30290000 {
+				compatible =3D "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg =3D <0x30290000 0x10000>;
+				interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_WDOG2_ROOT>;
+				status =3D "disabled";
+			};
+
+			wdog3: watchdog@302a0000 {
+				compatible =3D "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg =3D <0x302a0000 0x10000>;
+				interrupts =3D <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_WDOG3_ROOT>;
+				status =3D "disabled";
+			};
 		};
=20
 		bus@30400000 { /* AIPS2 */
--=20
2.7.4
