From: Philippe Schenker <dev@pschenker.ch>
Subject: [PATCH 11/22] ARM: dts: imx6: Add sleep state to can interfaces
Date: Tue, 30 Jul 2019 16:46:38 +0200
Message-ID: <20190730144649.19022-12-dev@pschenker.ch>
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

This patch prepares the devicetree for the new Ixora V1.2 where we are
able to turn off the supply of the can transceiver. This implies to use
a sleep state on transmission pins in order to prevent backfeeding.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
---

 arch/arm/boot/dts/imx6qdl-apalis.dtsi | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 7c4ad541c3f5..59ed2e4a1fd1 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -148,14 +148,16 @@
 };
 
 &can1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_flexcan1_default>;
+	pinctrl-1 = <&pinctrl_flexcan1_sleep>;
 	status = "disabled";
 };
 
 &can2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan2>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_flexcan2_default>;
+	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
 	status = "disabled";
 };
 
@@ -599,19 +601,32 @@
 		>;
 	};
 
-	pinctrl_flexcan1: flexcan1grp {
+	pinctrl_flexcan1_default: flexcan1defgrp {
 		fsl,pins = <
 			MX6QDL_PAD_GPIO_7__FLEXCAN1_TX 0x1b0b0
 			MX6QDL_PAD_GPIO_8__FLEXCAN1_RX 0x1b0b0
 		>;
 	};
 
-	pinctrl_flexcan2: flexcan2grp {
+	pinctrl_flexcan1_sleep: flexcan1slpgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_7__GPIO1_IO07 0x0
+			MX6QDL_PAD_GPIO_8__GPIO1_IO08 0x0
+		>;
+	};
+
+	pinctrl_flexcan2_default: flexcan2defgrp {
 		fsl,pins = <
 			MX6QDL_PAD_KEY_COL4__FLEXCAN2_TX 0x1b0b0
 			MX6QDL_PAD_KEY_ROW4__FLEXCAN2_RX 0x1b0b0
 		>;
 	};
+	pinctrl_flexcan2_sleep: flexcan2slpgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL4__GPIO4_IO14 0x0
+			MX6QDL_PAD_KEY_ROW4__GPIO4_IO15 0x0
+		>;
+	};
 
 	pinctrl_gpio_bl_on: gpioblon {
 		fsl,pins = <
-- 
2.22.0
