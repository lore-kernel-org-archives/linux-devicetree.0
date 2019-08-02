From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 45/76] arm64: dts: imx8mq: fix SAI compatible
Date: Fri,  2 Aug 2019 09:19:19 -0400
Message-ID: <20190802131951.11600-45-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Lucas Stach <l.stach@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Lucas Stach <l.stach@pengutronix.de>

[ Upstream commit 8d0148473dece51675d11dd59b8db5fe4b5d2e7e ]

The i.MX8M SAI block is not compatible with the i.MX6SX one, as the
register layout has changed due to two version registers being added
at the beginning of the address map. Remove the bogus compatible.

Fixes: 8c61538dc945 ("arm64: dts: imx8mq: Add SAI2 node")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 6d635ba0904c5..6632cbd88bed3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -675,8 +675,7 @@
 
 			sai2: sai@308b0000 {
 				#sound-dai-cells = <0>;
-				compatible = "fsl,imx8mq-sai",
-					     "fsl,imx6sx-sai";
+				compatible = "fsl,imx8mq-sai";
 				reg = <0x308b0000 0x10000>;
 				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MQ_CLK_SAI2_IPG>,
-- 
2.20.1
