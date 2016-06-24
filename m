From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v2 1/5] Documentation: DT: vdma: Update binding doc for multi-channel dma mode
Date: Fri, 24 Jun 2016 10:51:22 +0530
Message-ID: <1466745686-23898-2-git-send-email-appanad@xilinx.com>
References: <1466745686-23898-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466745686-23898-1-git-send-email-appanad@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch updates the device-tree binding doc for
AXI DMA multi channel dma mode.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
Changes for v2:
---> Added Rob Acked-by.

 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
index a1f2683..0faa189 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
@@ -40,6 +40,8 @@ Required properties for VDMA:
 Optional properties:
 - xlnx,include-sg: Tells configured for Scatter-mode in
 	the hardware.
+Optional properties for AXI DMA:
+- xlnx,mcdma: Tells whether configured for multi-channel mode in the hardware.
 Optional properties for VDMA:
 - xlnx,flush-fsync: Tells which channel to Flush on Frame sync.
 	It takes following values:
@@ -60,6 +62,8 @@ Optional child node properties:
 Optional child node properties for VDMA:
 - xlnx,genlock-mode: Tells Genlock synchronization is
 	enabled/disabled in hardware.
+Optional child node properties for AXI DMA:
+-dma-channels: Number of dma channels in child node.
 
 Example:
 ++++++++
-- 
1.7.1
