From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 16/22] ARM: dts: imx6ull-colibri: Add sleep mode to fec
Date: Tue, 30 Jul 2019 16:46:43 +0200
Message-ID: <20190730144649.19022-17-dev@pschenker.ch>
References: <20190730144649.19022-1-dev@pschenker.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-1-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, stefan@agner.ch, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

From: Philippe Schenker <philippe.schenker@toradex.com>

Do not change the clock as the power for this phy is switched
with that clock.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 arch/arm/boot/dts/imx6ull-colibri.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
index d56728f03c35..1019ce69a242 100644
--- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
@@ -62,8 +62,9 @@
 };
 
 &fec2 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet2>;
+	pinctrl-1 = <&pinctrl_enet2_sleep>;
 	phy-mode = "rmii";
 	phy-handle = <&ethphy1>;
 	status = "okay";
@@ -220,6 +221,21 @@
 		>;
 	};
 
+	pinctrl_enet2_sleep: enet2sleepgrp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO06__GPIO1_IO06	0x0
+			MX6UL_PAD_GPIO1_IO07__GPIO1_IO07	0x0
+			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x0
+			MX6UL_PAD_ENET2_RX_DATA1__GPIO2_IO09	0x0
+			MX6UL_PAD_ENET2_RX_EN__GPIO2_IO10	0x0
+			MX6UL_PAD_ENET2_RX_ER__GPIO2_IO15	0x0
+			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
+			MX6UL_PAD_ENET2_TX_DATA0__GPIO2_IO11	0x0
+			MX6UL_PAD_ENET2_TX_DATA1__GPIO2_IO12	0x0
+			MX6UL_PAD_ENET2_TX_EN__GPIO2_IO13	0x0
+		>;
+	};
+
 	pinctrl_ecspi1_cs: ecspi1-cs-grp {
 		fsl,pins = <
 			MX6UL_PAD_LCD_DATA21__GPIO3_IO26	0x000a0
-- 
2.22.0
