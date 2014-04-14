From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 4/9] ARM: shmobile: r8a7790: Add DMA for MMCIF1
Date: Mon, 14 Apr 2014 22:35:07 +0100
Message-ID: <1397511312-4845-5-git-send-email-ben.dooks@codethink.co.uk>
References: <1397511312-4845-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1397511312-4845-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-sh-owner@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk, dmaengine@vger.kernel.org
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, linux-sh@vger.kernel.org, magnus.damm@opensource.se, horms@verge.net.au, g.liakhovetski@gmx.d, kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: devicetree@vger.kernel.org

Updated dtsi file with DMA info for MMCIF1

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/arm/boot/dts/r8a7790.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index e85e354..8b66de8 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -316,6 +316,9 @@
 		reg = <0 0xee220000 0 0x80>;
 		interrupts = <0 170 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7790_CLK_MMCIF1>;
+		dmas =  <&dma0 R8A7790_DMA_MMCIF1_RX CHCR_RX_32BIT>,
+			<&dma0 R8A7790_DMA_MMCIF1_TX CHCR_TX_32BIT>;
+		dma-names = "rx", "tx";
 		reg-io-width = <4>;
 		status = "disabled";
 	};
-- 
1.9.1

