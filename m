From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v4 4/5] Documentation: DT: vdma: update binding doc for AXI CDMA
Date: Thu, 7 Apr 2016 10:59:44 +0530
Message-ID: <1460006985-14805-5-git-send-email-appanad@xilinx.com>
References: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460006985-14805-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch updates the device-tree binding doc for
adding support for AXI CDMA.

Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
Changes for v4:
---> None.
Changes for v3:
---> Removed CDMA DT example from the patch as suggested by the Rob.
Changes for v2:
---> Modified commit message as suggested by Vinod.
---> Moved the patch to forward in the series as suggested by vinod.

 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index 3fb23fe..fcc2b65 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
@@ -8,8 +8,12 @@ target devices. It can be configured to have one channel or two channels.
 If configured as two channels, one is to transmit to the device and another
 is to receive from the device.
 
+Xilinx AXI CDMA engine, it does transfers between memory-mapped source
+address and a memory-mapped destination address.
+
 Required properties:
-- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00.a"
+- compatible: Should be "xlnx,axi-vdma-1.00.a" or "xlnx,axi-dma-1.00.a" or
+	      "xlnx,axi-cdma-1.00.a""
 - #dma-cells: Should be <1>, see "dmas" property below
 - reg: Should contain VDMA registers location and length.
 - xlnx,addrwidth: Should be the vdma addressing size in bits(ex: 32 bits).
-- 
2.1.2
