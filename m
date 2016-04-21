From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v3 0/3] dmaengine: Add clock support for AXI DMAS
Date: Thu, 21 Apr 2016 16:08:35 +0530
Message-ID: <1461235118-800-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, anirudh@xilinx.com, punnaia@xilinx.com, shubhraj@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds basic clock support for AXI DMAS
This patch series is created on top of the 
"dmaengine: vdma: AXI DMA's enhancments" patch series.

Kedareswara rao Appana (3):
  dmaengine: vdma: Add config structure to differentiate dmas
  Documentation: DT: vdma: Add clock support for dmas
  dmaengine: vdma: Add clock support

 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |  15 +
 drivers/dma/xilinx/xilinx_vdma.c                   | 304 ++++++++++++++++++---
 2 files changed, 287 insertions(+), 32 deletions(-)

-- 
2.1.2
