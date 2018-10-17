From: Peng Ma <peng.ma@nxp.com>
Subject: [v9 6/7] arm64: dts: ls1046a: add qdma device tree nodes
Date: Wed, 17 Oct 2018 13:59:56 +0800
Message-ID: <20181017055957.542-6-peng.ma@nxp.com>
References: <20181017055957.542-1-peng.ma@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017055957.542-1-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, dan.j.williams@intel.com, zw@zh-kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Peng Ma <peng.ma@nxp.com>, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

add the qDMA device tree nodes for LS1046A devices.

Signed-off-by: Wen He <wen.he_1@nxp.com>
Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
change in v9:
	- add interrupts for each virtual block 
	- add block-number
	- add block-offset

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index ef83786..2a48d9b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -704,6 +704,27 @@
 					<0000 0 0 4 &gic GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		qdma: dma-controller@8380000 {
+			compatible = "fsl,ls1046a-qdma", "fsl,ls1021a-qdma";
+			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
+			      <0x0 0x8390000 0x0 0x10000>, /* Status regs */
+			      <0x0 0x83a0000 0x0 0x40000>; /* Block regs */
+			interrupts = <0 153 0x4>,
+				     <0 39 0x4>,
+				     <0 40 0x4>,
+				     <0 41 0x4>,
+				     <0 42 0x4>;
+			interrupt-names = "qdma-error", "qdma-queue0",
+				"qdma-queue1", "qdma-queue2", "qdma-queue3";
+			dma-channels = <8>;
+			block-number = <1>;
+			block-offset = <0x10000>;
+			fsl,dma-queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 	};
 
 	reserved-memory {
-- 
1.7.1
