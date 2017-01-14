From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v6 0/3] dmaengine: xilinx_dma: Bug fixes
Date: Sat, 14 Jan 2017 11:05:52 +0530
Message-ID: <1484372155-19423-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, vinod.koul@intel.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, appanad@xilinx.com, moritz.fischer@ettus.com, laurent.pinchart@ideasonboard.com, luis@debethencourt.com, Jose.Abreu@synopsys.com
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series fixes below bugs in DMA and VDMA IP's
---> Do not start VDMA until frame buffer is processed by the h/w
---> Fix bug in Multi frame sotres handling in VDMA
---> Fix issues w.r.to multi frame descriptors submit with AXI DMA S2MM(recv) Side.

Kedareswara rao Appana (3):
  dmaengine: xilinx_dma: Check for channel idle state before submitting
    dma descriptor
  dmaeninge: xilinx_dma: Fix bug in multiple frame stores scenario in
    vdma
  dmaengine: xilinx_dma: Fix race condition in the driver for multiple
    descriptor scenario

 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   2 +
 drivers/dma/xilinx/xilinx_dma.c                    | 270 ++++++++++++---------
 2 files changed, 161 insertions(+), 111 deletions(-)

-- 
2.1.2
