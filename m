From: Andrea Merello <andrea.merello@gmail.com>
Subject: [PATCH v6 6/7] dt-bindings: dmaengine: xilinx_dma: drop include-sg property
Date: Tue, 20 Nov 2018 16:31:50 +0100
Message-ID: <20181120153151.18024-6-andrea.merello@gmail.com>
References: <20181120153151.18024-1-andrea.merello@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120153151.18024-1-andrea.merello@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, radhey.shyam.pandey@xilinx.com, Andrea Merello <andrea.merello@gmail.com>
List-Id: devicetree@vger.kernel.org

This property is not needed anymore, because the driver now autodetects it.
Delete references in documentation.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
	- cc DT maintainer
Changes in v3:
	- cc DT maintainerS/ML
Changes in v4:
	None
Changes in v5:
	None
Changes in v6:
	Fix wrong property name in commit title
---
 Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
index 2fce9fb4b270..93b6d961dd4f 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
+++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
@@ -37,9 +37,6 @@ Required properties:
 Required properties for VDMA:
 - xlnx,num-fstores: Should be the number of framebuffers as configured in h/w.
 
-Optional properties:
-- xlnx,include-sg: Tells configured for Scatter-mode in
-	the hardware.
 Optional properties for AXI DMA:
 - xlnx,sg-length-width: Should be set to the width in bits of the length
 	register as configured in h/w. Takes values {8...26}. If the property
-- 
2.17.1
