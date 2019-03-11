From: Eric Nelson <eric@nelint.com>
Subject: [PATCH 2/2] ARM: dts: imx6q: remove references to PLL4_AUDIO_DIV
Date: Mon, 11 Mar 2019 08:59:57 -0700
Message-ID: <1552319997-24622-3-git-send-email-eric@nelint.com>
References: <1552304271.2453.12.camel@pengutronix.de>
 <1552319997-24622-1-git-send-email-eric@nelint.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552319997-24622-1-git-send-email-eric@nelint.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org, tiny.windzz@gmail.com, Eric Nelson <eric@nelint.com>
List-Id: devicetree@vger.kernel.org

Since we removed the PLL4_AUDIO_DIV clock, we need to replace
any references to it in the device tree with PLL4_POST_DIV to
keep the proper parents.

Signed-off-by: Eric Nelson <eric@nelint.com>
---
 arch/arm/boot/dts/imx6q-cm-fx6.dts       | 4 ++--
 arch/arm/boot/dts/imx6q-novena.dts       | 2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
index cab9e92..ef2cce5 100644
--- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
+++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
@@ -448,8 +448,8 @@
 
 &ssi2 {
 	assigned-clocks = <&clks IMX6QDL_CLK_SSI2_SEL>,
-			<&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>;
-	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>;
+			<&clks IMX6QDL_CLK_PLL4_POST_DIV>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL4_POST_DIV>;
 	assigned-clock-rates = <0>, <786432000>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index 61347a5..82cf8a7 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -418,7 +418,7 @@
 				  <&clks IMX6QDL_CLK_PLL4_AUDIO>,
 				  <&clks IMX6QDL_CLK_CKO1>;
 		assigned-clock-parents = <&clks IMX6QDL_CLK_CKO1>,
-					 <&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>,
+					 <&clks IMX6QDL_CLK_PLL4_POST_DIV>,
 					 <&clks IMX6QDL_CLK_OSC>,
 					 <&clks IMX6QDL_CLK_CKO1_PODF>;
 		assigned-clock-rates = <0 0 722534400 22579200>;
diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 1280de5..9d4bd57 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -284,7 +284,7 @@
 	pinctrl-0 = <&pinctrl_esai>;
 	assigned-clocks = <&clks IMX6QDL_CLK_ESAI_SEL>,
 			  <&clks IMX6QDL_CLK_ESAI_EXTAL>;
-	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL4_POST_DIV>;
 	assigned-clock-rates = <0>, <24576000>;
 	status = "okay";
 };
-- 
2.7.4
