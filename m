From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v3 0/5] dmaengine: vdma: AXI DMA's enhancments
Date: Wed, 6 Apr 2016 21:45:30 +0530
Message-ID: <1459959335-24083-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, svemula@xilinx.com, anirudh@xilinx.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series does some enhancments to the VDMA driver
which includes
--> Adding support for AXI DMA IP.
--> Adding support for AXI CDMA IP.

Kedareswara rao Appana (5):
  Documentation: DT: vdma: Rename vdma-chan prefix to dma-chan
  Documentation: DT: vdma: update binding doc for AXI DMA
  dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access
    Engine
  Documentation: DT: vdma: update binding doc for AXI CDMA
  dmaengine: vdma: Add Support for Xilinx AXI Central Direct Memory
    Access Engine

 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |  25 +-
 drivers/dma/xilinx/xilinx_vdma.c                   | 710 +++++++++++++++++++--
 include/linux/dma/xilinx_dma.h                     |  14 +
 3 files changed, 699 insertions(+), 50 deletions(-)

-- 
2.1.2
