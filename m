From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 1/4] arm64: dts: imx8mq: Fix the fsl,imx8mq-sdma compatible string
Date: Thu, 28 Mar 2019 06:38:25 -0700
Message-ID: <20190328133828.20999-2-angus@akkea.ca>
References: <20190328133828.20999-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328133828.20999-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus@akkea.ca
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fix a typo in the compatible string

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 81d5ce1b1ec1..07099f82965e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -720,7 +720,7 @@
 			};
 
 			sdma1: sdma@30bd0000 {
-				compatible = "fsl, imx8mq-sdma","fsl,imx7d-sdma";
+				compatible = "fsl,mx8mq-sdma","fsl,imx7d-sdma";
 				reg = <0x30bd0000 0x10000>;
 				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SDMA1_ROOT>,
-- 
2.17.1
