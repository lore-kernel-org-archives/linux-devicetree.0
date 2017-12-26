From: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
Subject: [V2 5/6] arm64: dts: ls1046a: add qdma device tree nodes
Date: Tue, 26 Dec 2017 13:47:53 +0800
Message-ID: <20171226054754.14969-3-wen.he_1@nxp.com>
References: <20171226054754.14969-1-wen.he_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171226054754.14969-1-wen.he_1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, jiafei.pan-3arQi8VN3Tc@public.gmane.org, jiaheng.fan-3arQi8VN3Tc@public.gmane.org, Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

add the qDMA device tree nodes for LS1046A devices.

Signed-off-by: Wen He <wen.he_1-3arQi8VN3Tc@public.gmane.org>
---
change in v2:
	- Add commits messages
	- Replace 'channels' by 'dma-channels'
	- Replace 'qdma@8380000' by 'dma-controller@8380000'

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 06b5e12..b4a0800 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -595,6 +595,21 @@
 				 <&clockgen 4 1>;
 		};
 
+		qdma: dma-controller@8380000 {
+			compatible = "fsl,ls1021a-qdma", "fsl,ls1046a-qdma";
+			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
+				<0x0 0x8390000 0x0 0x10000>, /* Status regs */
+				<0x0 0x83a0000 0x0 0x40000>; /* Block regs */
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue";
+			dma-channels = <8>;
+			queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 		usb0: usb@2f00000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
