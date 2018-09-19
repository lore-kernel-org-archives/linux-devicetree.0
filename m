From: laurentiu.tudor@nxp.com
Subject: [PATCH 16/21] arm64: dts: ls1046a: add smmu node
Date: Wed, 19 Sep 2018 15:36:08 +0300
Message-ID: <20180919123613.15092-17-laurentiu.tudor@nxp.com>
References: <20180919123613.15092-1-laurentiu.tudor@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919123613.15092-1-laurentiu.tudor@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: roy.pledge@nxp.com, madalin.bucur@nxp.com, davem@davemloft.net, shawnguo@kernel.org, leoyang.li@nxp.com, Laurentiu Tudor <laurentiu.tudor@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

This allows for the SMMU device to be probed by the SMMU kernel driver.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index ef83786b8b90..06863d3e4a7d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -228,6 +228,48 @@
 			bus-width = <4>;
 		};
 
+		mmu: iommu@9000000 {
+			compatible = "arm,mmu-500";
+			reg = <0 0x9000000 0 0x400000>;
+			dma-coherent;
+			#global-interrupts = <2>;
+			#iommu-cells = <1>;
+			interrupts = <0 142 4>, /* global secure fault */
+				     <0 143 4>, /* combined secure interrupt */
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>,
+				     <0 142 4>;
+		};
+
 		scfg: scfg@1570000 {
 			compatible = "fsl,ls1046a-scfg", "syscon";
 			reg = <0x0 0x1570000 0x0 0x10000>;
-- 
2.17.1
