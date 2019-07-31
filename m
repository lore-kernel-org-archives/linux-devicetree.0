From: Philippe Schenker <philippe.schenker@toradex.com>
Subject: [PATCH v2 04/20] ARM: dts: imx7-colibri: Add sleep mode to ethernet
Date: Wed, 31 Jul 2019 12:38:06 +0000
Message-ID: <20190731123750.25670-5-philippe.schenker@toradex.com>
References: <20190731123750.25670-1-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190731123750.25670-1-philippe.schenker@toradex.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Add sleep pinmux to the fec so it can properly sleep.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

Changes in v2: None

 arch/arm/boot/dts/imx7-colibri.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-c=
olibri.dtsi
index 52046085ce6f..a8d992f3e897 100644
--- a/arch/arm/boot/dts/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7-colibri.dtsi
@@ -101,8 +101,9 @@
 };
=20
 &fec1 {
-	pinctrl-names =3D "default";
+	pinctrl-names =3D "default", "sleep";
 	pinctrl-0 =3D <&pinctrl_enet1>;
+	pinctrl-1 =3D <&pinctrl_enet1_sleep>;
 	clocks =3D <&clks IMX7D_ENET_AXI_ROOT_CLK>,
 		<&clks IMX7D_ENET_AXI_ROOT_CLK>,
 		<&clks IMX7D_ENET1_TIME_ROOT_CLK>,
@@ -463,6 +464,22 @@
 		>;
 	};
=20
+	pinctrl_enet1_sleep: enet1sleepgrp {
+		fsl,pins =3D <
+			MX7D_PAD_ENET1_RGMII_RX_CTL__GPIO7_IO4		0x0
+			MX7D_PAD_ENET1_RGMII_RD0__GPIO7_IO0		0x0
+			MX7D_PAD_ENET1_RGMII_RD1__GPIO7_IO1		0x0
+			MX7D_PAD_ENET1_RGMII_RXC__GPIO7_IO5		0x0
+
+			MX7D_PAD_ENET1_RGMII_TX_CTL__GPIO7_IO10		0x0
+			MX7D_PAD_ENET1_RGMII_TD0__GPIO7_IO6		0x0
+			MX7D_PAD_ENET1_RGMII_TD1__GPIO7_IO7		0x0
+			MX7D_PAD_GPIO1_IO12__GPIO1_IO12			0x0
+			MX7D_PAD_SD2_CD_B__GPIO5_IO9			0x0
+			MX7D_PAD_SD2_WP__GPIO5_IO10			0x0
+		>;
+	};
+
 	pinctrl_ecspi3_cs: ecspi3-cs-grp {
 		fsl,pins =3D <
 			MX7D_PAD_I2C2_SDA__GPIO4_IO11		0x14
--=20
2.22.0
