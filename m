From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v12 1/2] Documentation: DT: dma: Add Xilinx zynqmp dma device
 tree binding documentation
Date: Fri, 1 Jul 2016 17:07:05 +0530
Message-ID: <1467373026-27768-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, punnaia@xilinx.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Device-tree binding documentation for Xilinx zynqmp dma engine
used in Zynq UltraScale+ MPSoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
Changes in v12:
- None.
Changes in v11:
- None.
Changes in v10:
- Added Rob Acked-by in the commit message.
Changs in v9:
- Removed include sg runtime configuration parameter
  from the binding doc as suggested by Lars.
Changes in v8:
- Removed all the software runtime configuration parameters
  from the binding doc as suggested by the Lars.
Changes in v7:
- None.
Changes in v6:
- Removed desc-axi-cache/dst-axi-cache/src-axi-cache properties
  from the binding doc as it allow broken combinations when dma-coherent
  is set as suggested by Rob.
- Fixed minor comments given by Rob related coding(lower case DT node name).
Changes in v5:
- Use dma-coherent flag for coherent transfers as suggested by rob.
- Removed unnecessary properties from binding doc as suggested by Rob.
Changes in v4:
- None
Changes in v3:
- None
Changes in v2:
- None.

 .../devicetree/bindings/dma/xilinx/zynqmp_dma.txt  |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt

diff --git a/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
new file mode 100644
index 0000000..a784cdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/xilinx/zynqmp_dma.txt
@@ -0,0 +1,27 @@
+Xilinx ZynqMP DMA engine, it does support memory to memory transfers,
+memory to device and device to memory transfers. It also has flow
+control and rate control support for slave/peripheral dma access.
+
+Required properties:
+- compatible		: Should be "xlnx,zynqmp-dma-1.0"
+- reg			: Memory map for gdma/adma module access.
+- interrupt-parent	: Interrupt controller the interrupt is routed through
+- interrupts		: Should contain DMA channel interrupt.
+- xlnx,bus-width	: Axi buswidth in bits. Should contain 128 or 64
+- clock-names		: List of input clocks "clk_main", "clk_apb"
+			  (see clock bindings for details)
+
+Optional properties:
+- dma-coherent		: Present if dma operations are coherent.
+
+Example:
+++++++++
+fpd_dma_chan1: dma@fd500000 {
+	compatible = "xlnx,zynqmp-dma-1.0";
+	reg = <0x0 0xFD500000 0x1000>;
+	interrupt-parent = <&gic>;
+	interrupts = <0 117 4>;
+	clock-names = "clk_main", "clk_apb";
+	xlnx,bus-width = <128>;
+	dma-coherent;
+};
-- 
1.7.1
