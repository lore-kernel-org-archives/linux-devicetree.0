From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v2 3/3] arm64: dts: imx8mq: Change ahb clock for imx8mq
Date: Fri, 29 Mar 2019 08:21:30 -0700
Message-ID: <20190329152130.18411-4-angus@akkea.ca>
References: <20190328133828.20999-1-angus@akkea.ca>
 <20190329152130.18411-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329152130.18411-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus.ainslie@puri.sm
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Set ahb clock on sdma1 to get rid of "Timeout waiting for CH0"
on the imx8mq.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 06158625f24f..7233d9a315b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -724,7 +724,7 @@
 				reg = <0x30bd0000 0x10000>;
 				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SDMA1_ROOT>,
-					 <&clk IMX8MQ_CLK_SDMA1_ROOT>;
+					 <&clk IMX8MQ_CLK_AHB>;
 				clock-names = "ipg", "ahb";
 				#dma-cells = <3>;
 				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
-- 
2.17.1
