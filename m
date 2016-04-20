From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH 1/2] Documentation: DT: vdma: Add clock support for vdma
Date: Wed, 20 Apr 2016 12:49:59 +0530
Message-ID: <1461136800-20334-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com, punnaia@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch updates the binding doc with clock description
for vdma.

Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index fcc2b65..e1c9019 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
@@ -21,6 +21,10 @@ Required properties:
 - dma-channel child node: Should have at least one channel and can have up to
 	two channels per device. This node specifies the properties of each
 	DMA channel (see child node properties below).
+- clocks: Input clock specifier. Refer to common clock bindings.
+- clock-names: List of input clocks "axi_clk", "tx_clk", "txs_clk" (list of input
+	       cloks may vary based on the ip configuration. see clock bindings
+	       for more info).
 
 Required properties for VDMA:
 - xlnx,num-fstores: Should be the number of framebuffers as configured in h/w.
@@ -60,6 +64,8 @@ axi_vdma_0: axivdma@40030000 {
 	xlnx,num-fstores = <0x8>;
 	xlnx,flush-fsync = <0x1>;
 	xlnx,addrwidth = <0x20>;
+	clocks = <&clk 0>, <&clk 1>, <&clk 2>;
+	clock-names = "axi_clk", "tx_clk", "txs_clk";
 	dma-channel@40030000 {
 		compatible = "xlnx,axi-vdma-mm2s-channel";
 		interrupts = < 0 54 4 >;
-- 
2.1.2
