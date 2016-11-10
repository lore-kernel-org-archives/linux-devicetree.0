From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH] ARM: dts: vfxxx: Enable DMA for DSPI2 and DSPI3
Date: Thu, 10 Nov 2016 17:15:05 +0530
Message-ID: <20161110114505.17618-1-maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: stefan@agner.ch, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Enable DMA for DSPI2 and DSPI3 on Vybrid.
---
 arch/arm/boot/dts/vfxxx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 000550f..e9d2847 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -573,6 +573,9 @@
 				clocks = <&clks VF610_CLK_DSPI2>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
+				dmas = <&edma1 0 10>,
+					<&edma1 0 11>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -585,6 +588,9 @@
 				clocks = <&clks VF610_CLK_DSPI3>;
 				clock-names = "dspi";
 				spi-num-chipselects = <2>;
+				dmas = <&edma1 0 12>,
+					<&edma1 0 13>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
-- 
2.10.2
