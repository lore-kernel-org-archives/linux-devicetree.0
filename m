From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq: Add cpu opp table
Date: Tue, 12 Feb 2019 12:11:02 +0000
Message-ID: <1549973439-26706-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8MQ cpu OPP table info for cpu-freq driver.

Signed-off-by: Anson Huang <anson.huang@nxp.com>
Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 9155bd4..579015c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -672,3 +672,17 @@
 		};
 	};
 };
+
+&A53_0 {
+	operating-points =3D <
+		/* kHz    uV */
+		1200000 900000
+		800000  900000
+	>;
+	clocks =3D <&clk IMX8MQ_CLK_A53_DIV>, <&clk IMX8MQ_CLK_A53_SRC>,
+		<&clk IMX8MQ_ARM_PLL>, <&clk IMX8MQ_ARM_PLL_OUT>,
+		<&clk IMX8MQ_SYS1_PLL_800M>;
+	clock-names =3D "a53", "arm_a53_src", "arm_pll",
+		"arm_pll_out", "sys1_pll_800m";
+	clock-latency =3D <61036>;
+};
--=20
2.7.4
