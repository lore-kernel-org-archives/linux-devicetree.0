From: Hao Zhang <hao5781286@gmail.com>
Subject: [PATCH v4 2/3] ARM64: dts: sun6i: add dma node for a64.
Date: Sun, 20 Nov 2016 18:45:39 +0800
Message-ID: <1479638740-20520-3-git-send-email-hao5781286@gmail.com>
References: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479638740-20520-1-git-send-email-hao5781286@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, dan.j.williams@intel.com, vinod.koul@intel.com, mark.rutland@arm.com, robh+dt@kernel.org, catalin.marinas@arm.com, will.deacon@arm.com
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, hao5781286@gmail.com
List-Id: devicetree@vger.kernel.org

Accroding to the Allwinner_A64_User_Manual_V1.0 P198
the DMA base address is 0x01c02000.

Signed-off-by: Hao Zhang <hao5781286@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e3c3d7d8..403bbfa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -122,6 +122,15 @@
 		#size-cells = <1>;
 		ranges;
 
+		dma: dma-controller@1c02000 {
+			compatible = "allwinner,sun50i-a64-dma";
+			reg = <0x01c02000 0x1000>;
+			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_DMA>;
+			resets = <&ccu RST_BUS_DMA>;
+			#dma-cells = <1>;
+		};
+
 		ccu: clock@01c20000 {
 			compatible = "allwinner,sun50i-a64-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.7.4
