From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v2 0/5] dmaengine: vdma: AXI DMAS Enhancments
Date: Fri, 24 Jun 2016 10:51:21 +0530
Message-ID: <1466745686-23898-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, vinod.koul@intel.com, dan.j.williams@intel.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series does the following thing.
---> Add support for AXI DMA Multi-channel DMA mode.
---> Delete AXI DMA binding doc.
---> Rename the driver and update config options.

Kedareswara rao Appana (5):
  Documentation: DT: vdma: Update binding doc for multi-channel dma
    mode
  dmaengine: vdma: Add support for mulit-channel dma mode
  Documentation: DT: dma: Delete binding doc for AXI DMA
  dmaengine: dma: Rename driver and config
  dmaengine: dma: Use different channel names for each dma

 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   94 +++++++--
 .../devicetree/bindings/dma/xilinx/xilinx_vdma.txt |  107 ----------
 drivers/dma/Kconfig                                |   11 +-
 drivers/dma/xilinx/Makefile                        |    2 +-
 drivers/dma/xilinx/{xilinx_vdma.c => xilinx_dma.c} |  221 +++++++++++++++++---
 5 files changed, 277 insertions(+), 158 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
 rename drivers/dma/xilinx/{xilinx_vdma.c => xilinx_dma.c} (92%)
