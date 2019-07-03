From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH v2] arm64: dts: imx8mm: Init rates and parents configs for clocks
Date: Wed,  3 Jul 2019 15:08:22 +0300
Message-ID: <1562155702-29809-1-git-send-email-abel.vesa@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the initial configuration for clocks that need default parent and rate
setting. This is based on the vendor tree clock provider parents and rates
configuration except this is doing the setup in dts rather than using clock
consumer API in a clock provider driver.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---

Changes since v1:
 - removed the PCIE, CSI and DISP clocks parent setting since
   that should be done from their driver.

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a741..ba2034d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -451,6 +451,17 @@
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				assigned-clocks = <&clk IMX8MM_CLK_NOC>,
+						<&clk IMX8MM_CLK_AUDIO_AHB>,
+						<&clk IMX8MM_CLK_IPG_AUDIO_ROOT>,
+						<&clk IMX8MM_SYS_PLL3>,
+						<&clk IMX8MM_VIDEO_PLL1>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL3_OUT>,
+							 <&clk IMX8MM_SYS_PLL1_800M>;
+				assigned-clock-rates = <0>,
+							<400000000>,
+							<750000000>,
+							<594000000>;
 			};
 
 			src: reset-controller@30390000 {
-- 
2.7.4
